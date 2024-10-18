# My dotfiles

## Instalation guide

### Install dependencies

Use your favorite package manager (`paru -S` or `pacman -S` for Arch) to install these dependencies:

```bash
git stow ripgrep 
```

### Initialize dotfiles using [stow](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

```bash
cd
mkdir .config
git clone https://github.com/SherlockH0/.dotfiles.git
cd .dotfiles
stow --adopt .
```

### Tmux

```bash
tmux
tmux source ~/.config/tmux/tmux.conf
```

Instal packages: \
<kbd>Ctrl</kbd> + <kbd>O</kbd> + <kbd>I</kbd> (<kbd>\<prefix\></kbd> + <kbd>I</kbd>)

## Optional setups

<details>

<summary>Setup printer</summary>

```bash
sudo pacman -S caps system-config-printer
sudo systemctl enable --now cups
sudo usermod -aG lp $USER
```

[Install drivers](https://wiki.archlinux.org/title/CUPS/Printer-specific_problems)

</details>
