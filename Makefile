.PHONY: rebuild
rebuild:
	sudo nixos-rebuild switch --flake .#default

.PHONY: clean
clean:
	sudo nix-collect-garbage -d