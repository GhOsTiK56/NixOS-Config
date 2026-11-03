{ pkgs, tg-ws-proxy-src, ... }:

let
  pythonEnv = pkgs.python3.withPackages (
    ps: with ps; [
      websockets
      requests
      cryptography
      httpx
      h2
    ]
  );

  launcher = pkgs.writeText "tg-ws-proxy-launcher.py" ''
    import os
    import sys
    from pathlib import Path

    sys.path.insert(0, "${tg-ws-proxy-src}")

    from proxy.tg_ws_proxy import main

    secret_path = Path(os.environ["CREDENTIALS_DIRECTORY"]) / "secret"
    secret = secret_path.read_text(encoding="ascii").strip()

    sys.argv = [
        "tg-ws-proxy",
        "--host", "127.0.0.1",
        "--port", "1443",
        "--secret", secret,
    ]

    main()
  '';

in {
  systemd.services.tg-ws-proxy = {
    description = "Telegram MTProto WebSocket Bridge Proxy";

    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];

    serviceConfig = {
      Type = "simple";

      DynamicUser = true;

      LoadCredential = "secret:/etc/tg-ws-proxy/secret";

      ExecStart =
        "${pythonEnv}/bin/python -B ${launcher}";

      Restart = "on-failure";
      RestartSec = "5s";

      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      ProtectHome = true;
    };
  };
}
