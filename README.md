# Emacs/Evil/Cider

Here's my Emacs config, focusing on Clojure development with EVIL mode. It's my attempt to get the best of vim and emacs, so it's meant for people who are at least a bit comfortable with both.

I'd like to clean it up, refactor it, and document it extensively, but in the meantime here's what you should know:

* I use OS X, so there may some stuff in here that behaves strangely under Linux. Don't use Windows. Just... don't.
* The EVIL bindings are pretty close to what I got from [Steve Losh's excellent guide](http://stevelosh.com/blog/2010/09/coming-home-to-vim/)
* EVIL is usually on, but I turn it off for stuff like Magit and the CIDER REPL.
* evil-insert mode is a lot like Emacs normally is, but not quite exactly.
* <SPACE> is the leader key. It's not mapped to much, but <leader>G brings up Magit status, so that's cool.
* Paredit and CIDER keys are basically unchanged from the defaults.

## Install

You've got two choices:

1. Steal what you want to for your own Emacs config.
2. Clone this repo and move it to `~/.emacs.d`. 
