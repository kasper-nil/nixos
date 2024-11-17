{ pkgs, nixpkgs, ... }:
{
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  nixpkgs.config.pulseaudio = true;
  services.pipewire.enable = false;

  #security.rtkit.enable = true;
  #
  #services.pipewire = {
  #  enable = true;
  #  pulse.enable = true;
  #
  #  alsa = {
  #    enable = true;
  #    support32Bit = true;
  #  };
  #};
}
