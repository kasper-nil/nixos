{ ... }:
{
  security = {
    rtkit.enable = true;
    pki.certificateFiles = [
      /etc/nixos/certs/hrz-localhost.pem
    ];
  };
}
