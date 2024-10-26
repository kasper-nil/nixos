{ config, ... }:
{
  home.file."${config.home.homeDirectory}/.config/systemd/user/plasma-i3.service" = {
    enable = true;
    text = ''
      [Install]
      WantedBy=plasma-workspace.target

      [Unit]
      Description=Plasma Custom Window Manager
      Before=plasma-workspace.target

      [Service]
      ExecStart=/usr/bin/i3
      Slice=session.slice
      Restart=on-failure
    '';
  };
}
