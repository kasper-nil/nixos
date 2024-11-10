{ lib, ... }:
{
  # enable awesomewm
  home.activation = {
    installAwesomeWMConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ ! -d "$HOME/.config/awesome" ]; then
        ln -s "/etc/nixos/dotfiles/awesome" "$HOME/.config/awesome"
        chmod -R +w "$HOME/.config/awesome"
      fi
    '';
  };
}
