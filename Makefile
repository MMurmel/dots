# You probably need to install built-essentials beforehand to run this makefile.
SHELL=/bin/bash
.PHONY: all dependencies main_installations cleanup fonts

divider = "========================================="

# root dir for installation lists
dir = ./packages/

# lists of packages by different installation methods
# ignore lines starting with '#' and empty lines
# this enables better seperation in the list files
fonts = $(shell grep "^[^\#]" $(dir)fonts)
ppas = $(shell grep "^[^\#]" $(dir)ppas)
apt = $(shell grep "^[^\#]" $(dir)apt)
pip = $(shell grep "^[^\#]" $(dir)pip)
snaps = $(shell grep "^[^\#]" $(dir)snap)
snaps_classic = $(shell grep "^[^\#]" $(dir)snap-classic)

all: ppas apt snaps pip fonts cleanup 
core: apt snaps pip cleanup

info:
	@echo $(divider)
	@echo "Following packages are listed:"
	@echo $(divider)
	
	@echo "Fonts:"
	@echo
	@echo -e $(fonts) | tr ' ' '\n'
	@echo $(divider)
	
	@echo "PPAs:"
	@echo
	@echo -e $(ppas) | tr ' ' '\n'
	@echo $(divider)
	
	@echo "Apt-packages:"
	@echo
	@echo -e $(apt) | tr ' ' '\n'
	@echo $(divider)
	
	@echo "Pip-packages:"
	@echo
	@echo -e $(pip) | tr ' ' '\n'
	@echo $(divider)
	
	@echo "Snap-packages:"
	@echo
	@echo -e $(snaps) | tr ' ' '\n'
	@echo -e $(snaps_classic) | tr ' ' '\n'
	@echo $(divider)
	
fonts:
	@echo $(divider)
	@echo "Extracting fonts."
	@echo $(divider)
	$(foreach font,$(fonts), wget $(font) -O temp.zip; unzip temp.zip -d /usr/share/fonts/truetype/; rm temp.zip;)
	fc-cache -f -v

ppas:	
	@echo $(divider)
	@echo "Adding PPAs"
	@echo $(divider)
	$(foreach ppa, $(ppas), if ! grep -q "^deb .*${ppa}" /etc/apt/sources.list /etc/apt/sources.list.d/*; then add-apt-repository ppa:${ppa}; fi;)
	@echo $(divider)
	@echo "Finished installing ppas."

apt:
	@echo $(divider)
	@echo "Installing apt packages."
	@echo $(divider)
	apt install $(apt)
	@echo $(divider)
	@echo "Done installing apt packages."
	
snaps:
	@echo $(divider)
	@echo "Installing snap packages."
	@echo $(divider)
	$(foreach package,$(snaps), snap install $(package);)
	$(foreach package,$(snaps_classic), snap install $(package) --classic;)
	@echo $(divider)
	@echo "Done installing snap packages."

pip:
	@echo $(divider)
	@echo "Installing pip packages."
	@echo $(divider)
	pip3 install $(pip)
	@echo $(divider)
	@echo "Done installing pip packages."

cleanup:
	@echo $(divider)
	@echo "Beginning cleanup."
	@echo $(divider)
	apt autoclean 
	apt autoremove
