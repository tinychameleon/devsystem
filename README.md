# Development System Configuration
Automation for installing and configuring a system for development.

## Instructions
Run the [bootstrap.sh](./bootstrap.sh) script. This will do the following:

- Install Homebrew via curl.
- Install taps, packages, and casks.
- Install configuration using [GNU Stow](https://www.gnu.org/software/stow/).
- Updates user shell.
- Installs rustup via curl.

## Pre-Flight Checklist
- [ ] Backed up SSH keys
- [ ] Backed up GPG keys
- [ ] Backed up any private files
- [ ] Pushed any in-flight branches
