# My dotfiles

> [!NOTE]
> This repo contains only dotfiles unrelated to the window manager. [My window manager config](https://github.com/SherlockH0/HyprGruvbox).

## Gallery

![fastfetch](https://raw.githubusercontent.com/SherlockH0/.dotfiles/refs/heads/main/previews/fastfetch.png)
![neovim](https://raw.githubusercontent.com/SherlockH0/.dotfiles/refs/heads/main/previews/nvim.png)
![ncmpcpp](https://raw.githubusercontent.com/SherlockH0/.dotfiles/refs/heads/main/previews/ncmpcpp.png)

## Applications

- Terminal emulator: `kitty`
- Code editor: `neovim`
- Music player: `ncmpcpp`
- Flexer: `fastfetch`

## Instalation guide

### Install dependencies and applications

Use your favorite package manager (`paru -S` or `pacman -S` for Arch) to install these dependencies and applications:

```bash
luarocks git stow ripgrep npm
kitty tmux neovim ncmpcpp mpddris2-git fastfetch
```

Install [zoxide](https://github.com/ajeetdsouza/zoxide) and [starship](https://starship.rs/)

```bash
# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
# starship
curl -sS https://starship.rs/install.sh | sh
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
