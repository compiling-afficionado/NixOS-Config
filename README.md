## How to set up a machine with this config:

#### :warning: If your user is not "michael" change all occurences of "michael" in the code to your user name! Also modify [host]/configuration.nix to include correct drivers!

**TODO**: move driver configurations in to separate files so they are easier to not include. Also extract user name to a variable so would only need to change "michael" in one place?

**TODO**: add overview of config structure

1. Install NixOS on your machine
2. Add this to your /etc/nixos/configuration.nix:
    ```
    nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };
   ```
4. Run `sudo nixos-rebuild switch`
5. Enter shell with `nix-shell -p git` and clone this repo
6. `Cd` into the cloned repo directory
7. Copy your hardware configuration into appropriate profile e.g. if using desktop, place it in desktop/ `sudo cp /etc/nixos/hardware-configuration.nix ~/[path to this repo]/desktop/`
8. Run `sudo nixos-rebuild boot --flake .#nix-desktop` to switch to grub
9. Run `sudo nix flake update` to update packages
10. Run `sudo nixos-rebuild switch --flake .#nix-desktop` to apply configuration to OS
11. If everything works, remove non-flake NixOS configuration `sudo rm -rf /etc/nixos/`

Vscodium extension updates:
Since we have to pin extension versions in config, to update the extensions, need to run `nix-shell scripts/update_vscodium_extensions.sh`.This script will print latest versions of extensions. Take the output and replace the extension values in home.nix.
The script is taken from https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/vscode/extensions/update_installed_exts.sh
Also if vscodium complains about missing packages even though they are in your flake.nix, you need to launch vscodium from a `nix develop` shell e.g. `codium .`
