# Config for NixOS.

## Bootstrap scripts

### Clone repo
```
git clone https://github.com/CJBuchel/nixos-config ~/nixos-config
```

### Generate config and copy (use correct host i.e desktop)
```
sudo nixos-generate-config --show-hardware-config > ~/nixos-config/hardware-configuration.nix
```

### Build and switch to new config
```
sudo nixos-rebuild switch --flake ~/nixos-config
```
