# You probably need to install built-essentials beforehand to run this makefile.
SHELL=/bin/bash
.PHONY: all dependencies main_installations cleanup

divider = "----------------------"

# dependencies
ppas = ppa:mmstick76/alacritty
dependencies_apt = python3-dev python3-pip python3-setuptools

# packages to be installed via apt
wm =sway rofi redshift ranger nitrogen
essentials = build-essential neovim git alacritty arandr htop
software = firefox thunderbird nemo telegram-desktop nextcloud-desktop grub-customizer

# packages not available via apt
snap = bitwarden discord spotify
snap_classic = code
pip = thefuck

all: dependencies main_installations cleanup

dependencies:
	@echo $(divider)
	@echo "Installing dependencies."
	@echo $(divider)
	apt install $(dependencies_apt)
	
	@echo $(divider)
	@echo "Adding PPAs"
	$(foreach ppa,$(ppas), add-apt-repository $(ppa))
	@echo $(divider)
	
	@echo $(divider)
	@echo "finished installing dependencies."

main_installations:
	@echo $(divider)
	@echo "Installing main packages."
	@echo $(divider)
	apt install $(wm) $(essentials) $(software)
	
	@echo $(divider)
	@echo "Installing snap packages."
	@echo $(divider)
	$(foreach package,$(snap), snap install $(package);)
	$(foreach package,$(snap_classic),snap install $(package) --classic;)
	
	@echo $(divider)
	@echo "Installing pip packages. This might take a while..."
	@echo $(divider)
	pip3 install $(pip)
	
	@echo $(divider)
	@echo "Done installing packages."

cleanup:
	@echo $(divider)
	@echo "Beginning cleanup."
	@echo $(divider)
	apt autoclean 
	apt autoremove
