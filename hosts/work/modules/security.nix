{ ... }:
{
  security = {
    rtkit.enable = true;
    pki.certificateFiles = [
      ../certs/hrz.localhost.pem
      ../certs/hrz.localhost-key.pem
    ];
  };
}
