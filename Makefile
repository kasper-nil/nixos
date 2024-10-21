.PHONY: rebuild
rebuild:
	sudo nixos-rebuild switch --flake /etc/nixos#default

.PHONY: clean
clean:
	sudo nix-collect-garbage -d