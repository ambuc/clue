# clue
## A command-line utility for searching through and displaying your notes.

If you're like me, maybe you have a plain textfile somewhere with a whole bunch of commands, recipes, instructions, or hints you find it useful to have at your fingertips throughout the day. Rather than have a static textfile, I thought it might be useful to be able to do something like:

    $ clue brightness

    getting brightness?
        $ xbacklight -get
        $ xbacklight -get | mawk '{print(substr($1,1,length($1)-7))}'
    ---------------------------------------------------------------------------------
    syndaemon -t -i 1
    xbrightness -set 100
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"
    nm-connection-manager

You can't see it here, but this has `grep`-style highlighting and such.

## Installation
To install, just run the `./install.sh` script. It will create a `~/.clues` textfile and a `~/.cluesrc` config file. 

## Customization
If you want to back up your clues somewhere (like Dropbox), just move the `~/.clues` file somwhere else, and change the `$cluepath` in `~/.cluesrc`.

## Todo
- [ ] Add support for indexing folders of clue files
- [ ] Reduce indexing already-indexed files (or passages)
- [ ] Command-line flags for changing the $cluepath
