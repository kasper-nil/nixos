{ config, ... }:
{
  home.file."${config.home.homeDirectory}/.config/plasma-workspace/env/wm.sh" = {
    enable = true;
    text = ''
      #!/bin/sh
      export KDEWM=/usr/bin/i3
    '';
  };
}
