.PHONY: \
	all clean \
	i3 \
	vim \
	xorg \
	zsh 

all: i3 vim xorg zsh

clean:
	rm -rf \
		~/.i3/config  \
		~/.i3status \
		~/.Xresources \
		~/.zshrc \
		~/.oh-my-zsh/custom
	sudo rm -rf \
		/etc/vim/vimrc.local \
		/etc/vim/cscope_maps.vim

i3: i3/config i3/i3status.conf
	ln -sfv $(PWD)/i3/config ~/.i3/config
	ln -sfv $(PWD)/i3/i3status.conf ~/.i3status.conf

vim: vim/vimrc
	sudo ln -sfv $(PWD)/vim/vimrc /etc/vim/vimrc.local
	sudo ln -sfv $(PWD)/vim/cscope_maps.vim /etc/vim/cscope_maps.vim

xorg: xorg/Xresources
	ln -sfv $(PWD)/xorg/Xresources ~/.Xresources

zsh: zsh/zsh-custom zsh/zshrc
	ln -sfv $(PWD)/zsh/zshrc ~/.zshrc
	ln -sfv $(PWD)/zsh/zsh-custom ~/.oh-my-zsh/custom

repos:
	echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" > /etc/apt/sources.list.d/i3.list
	echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
	apt-get update
	apt-get --allow-unauthenticated install sur5r-keyring
	apt-get update

apps: repos
	sudo apt-get install zsh git-core pidgin pidgin-otr vim scudcloud i3 rofi google-chrome thunar git-cola \
	sudo ln -s /usr/bin/scudcloud /usr/local/bin/slack
	
oh-my-zsh:
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	
