EMACS ?= emacs

all: straight-compile

straight-compile:
	HOME=$(PWD) $(EMACS) -Q --batch -l .straight

straight-interactive:
	HOME=$(PWD) $(EMACS) -Q -nw -l .straight
