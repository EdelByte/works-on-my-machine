# works-on-my-machine

Dotfiles and config for my dev environment.

## Contents

- `.gitconfig` — Git configuration

## Install

Clone the repo and run the install script to symlink everything into place:

```bash
git clone https://github.com/EdelByte/works-on-my-machine.git ~/repos/works-on-my-machine
cd ~/repos/works-on-my-machine
chmod +x install.sh
./install.sh
```

Existing files are backed up to `<filename>.bak` before symlinking.
