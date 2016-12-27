# Makefile for setting up the environment.

LINK ?= ln -si

default: help

all: shell vc editor crypto conn tool

shell: tmux-shell zsh-shell
vc: git-vc
editor: vim-editor
crypto: gpg-crypto
conn: ssh-conn
tool: radare-tool

git-vc:
		$(LINK) $(PWD)/git/dot-gitconfig $(HOME)/.gitconfig
		$(LINK) $(PWD)/git/dot-gitignore_global $(HOME)/.gitignore_global

gpg-crypto:
		mkdir -p $(HOME)/.gnupg/
		$(LINK) $(PWD)/gpg/gpg-agent.conf $(HOME)/.gnupg/gpg-agent.conf
		$(LINK) $(PWD)/gpg/gpg.conf $(HOME)/.gnupg/gpg.conf

radare-tool:
		$(LINK) $(PWD)/radare/dot-radare2rc $(HOME)/.radare2rc

ssh-conn:
		mkdir -p $(HOME)/.ssh/config.d/
		$(LINK) $(PWD)/ssh/generic $(HOME)/.ssh/config.d/generic
		chmod 600 -R $(HOME)/.ssh/
		chmod 600 -R $(PWD)/ssh/

taskwarrior-tool:
		$(LINK) $(PWD)/taskwarrior/dot-taskrc $(HOME)/.taskrc

tmux-shell:
		$(LINK) $(PWD)/tmux/dot-tmux.conf $(HOME)/.tmux.conf

vim-editor:
		$(LINK) $(PWD)/vim/dot-vimrc $(HOME)/.vimrc

zsh-shell:
		mkdir -p $(HOME)/.oh-my-zsh/lib/
		$(LINK) $(PWD)/zsh/dot-zshrc $(HOME)/.zshrc
		$(LINK) $(PWD)/zsh/alias.zsh $(HOME)/.oh-my-zsh/lib/alias.zsh

help:
		echo "[+] Check out the file to see available commands"
		echo "..."
