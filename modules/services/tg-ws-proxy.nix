{ pkgs, tg-ws-proxy-src, ... }:

let
  # Keep the proxy's Python dependencies isolated from the global Python setup.
  pythonEnv = pkgs.python3.withPackages (ps: with ps; [
    websockets
    requests
    cryptography
    certifi
    httpx
    h2
  ]);

  launcher = pkgs.writeText "tg-ws-proxy-launcher.py" ''
    import os
    import sys
    from pathlib import Path

    # systemd exposes LoadCredential files through this private directory.
    secret_path = Path(os.environ["CREDENTIALS_DIRECTORY"]) / "secret"
    secret = secret_path.read_text(encoding="ascii").strip()

    class SecretRedactingStream:
        """Redact the credential from anything the upstream app writes to stderr."""

        def __init__(self, stream, value):
            self.stream = stream
            self.value = value

        def write(self, text):
            if self.value:
                text = text.replace(self.value, "[REDACTED]")
            return self.stream.write(text)

        def flush(self):
            return self.stream.flush()

        def __getattr__(self, name):
            return getattr(self.stream, name)

    # Upstream startup logs include the secret and a ready-to-use proxy link.
    # Stream-level redaction avoids depending on the upstream logger's name.
    sys.stderr = SecretRedactingStream(sys.stderr, secret)

    sys.path.insert(0, "${tg-ws-proxy-src}")
    from proxy.tg_ws_proxy import main

    # Keep the listener local; clients on this machine can connect to port 1443.
    sys.argv = [
        "tg-ws-proxy",
        "--host", "127.0.0.1",
        "--port", "1443",
        "--secret", secret,
    ]

    main()
  '';
in
{
  systemd.services.tg-ws-proxy = {
    description = "Telegram MTProto WebSocket Bridge Proxy";

    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];

    serviceConfig = {
      # A transient identity avoids creating a dedicated persistent system user.
      DynamicUser = true;

      # systemd makes the credential available only to this service at runtime.
      LoadCredential = "secret:/etc/tg-ws-proxy/secret";

      ExecStart = "${pythonEnv}/bin/python -B ${launcher}";
      Restart = "on-failure";
      RestartSec = "5s";

      # Restrict filesystem access; the service only needs its credential and network.
      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      ProtectHome = true;
    };
  };
}
