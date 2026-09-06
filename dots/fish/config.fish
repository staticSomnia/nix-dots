if status is-interactive
    # Commands to run in interactive sessions can go here
    alias ff='fastfetch'
    alias ns='sudo nixos-rebuild switch --flake ~/nix'
    alias nu='nix flake update --flake ~/nix'
    alias hs='home-manager switch --flake ~/nix'



    set -U fish_greeting

end
