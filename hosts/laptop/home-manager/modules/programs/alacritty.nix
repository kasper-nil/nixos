{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 11;
      };

      window = {
        padding = {
          x = 12;
          y = 8;
        };
      };
    };
  };
}
