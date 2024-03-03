if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then 
	exec startx; 
fi
. "$HOME/.cargo/env"

if [ -e /home/sherlock/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sherlock/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
