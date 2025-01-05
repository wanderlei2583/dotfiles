# NixOS Dotfiles

This repository contains my personal dotfiles for NixOS, featuring configurations for various development tools and terminal utilities.

## Structure

```
.
├── .zshrc
├── fish
├── kitty
├── nixpkgs
├── nvim
├── starship
├── tmux
└── zsh
```

## Components

***Wander_Dev*** 

### Shell Configuration
- **zsh**: Z shell configuration files and customizations
- **.zshrc**: Main Zsh configuration file
- **fish**: Fish shell configuration and functions
- **starship**: Cross-shell prompt configuration

### Terminal Emulator
- **kitty**: Configuration for the Kitty terminal emulator

### Development Tools
- **nvim**: Neovim configuration files, plugins, and settings
- **tmux**: Terminal multiplexer configuration

### System Configuration
- **nixpkgs**: NixOS packages and system configuration

## Installation

1. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/.dotfiles
```

2. Create symbolic links:
```bash
# Example for linking configurations
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/kitty ~/.config/kitty
ln -s ~/.dotfiles/tmux ~/.config/tmux
ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml
```

3. Rebuild NixOS configuration (if necessary):
```bash
sudo nixos-rebuild switch
```

## Features

- **Terminal**: Kitty terminal emulator with custom configuration
- **Shell**: 
  - Zsh configuration with custom plugins and themes
  - Fish shell as an alternative option
  - Starship prompt for enhanced shell experience
- **Development**:
  - Neovim setup with LSP support and custom plugins
  - Tmux configuration for enhanced terminal workflow
- **System**: NixOS configuration for reproducible system setup

## Requirements

- NixOS
- Git
- Zsh/Fish
- Neovim
- Tmux
- Kitty terminal

## Usage

Each directory contains its own specific configuration. Check individual directories for more detailed documentation.

### Common Tasks

1. Update NixOS configuration:
```bash
cd ~/.dotfiles/nixpkgs
# Edit configuration.nix or other relevant files
sudo nixos-rebuild switch
```

2. Update Neovim configuration:
```bash
cd ~/.dotfiles/nvim
# Edit init.lua or other configuration files
```

3. Modify shell settings:
```bash
# For Zsh
vim ~/.dotfiles/.zshrc

# For Fish
vim ~/.dotfiles/fish/config.fish
```

## Customization

Feel free to fork this repository and modify any configurations to match your preferences. Make sure to:

1. Update paths in configuration files
2. Modify keybindings to your liking
3. Adjust system settings in nixpkgs

## Contributing

If you have suggestions or improvements:

1. Fork the repository
2. Create a feature branch
3. Submit a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

This configuration is inspired by various dotfile repositories and customized for personal use with NixOS.

