{
  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };

  services = {
    pipewire.enable = true;
  };

  nixpkgs.config.pulseaudio = true;
}
