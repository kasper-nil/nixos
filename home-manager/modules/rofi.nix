{ pkgs, ... } : {
  home.packages = with pkgs; [
    rofi
  ];
  
  programs.rofi = {
    theme = "gruvbox-dark-hard";
  };
}