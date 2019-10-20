# sj-launcher.sh
Minimalist but extensible launcher written in POSIX shell. 

This is a small ~30 LOC launcher designed to be easily hackable.
It uses dmenu as a frontend, but you might as well replace it with fzf and run it on your terminal.

The idea is to provide a cohesive experience and a centralized menu to open files, launch programs, run recent commands, etc...

Adding custom functionality is as simple as:
1) Feed the selector with the possible values.
2) Add a new case statement to handle these values.

Now, its your choice to decide if you want to bookmark your most frequent directories by hand,
or crontab a oneliner to periodically cache your favorite songs

_Hint, that'd be something like:_

    $ find ~/Music/ -type f -exec echo f play - {} \; >> ~/.cache/song
    
'cause, you know, you can make it do anything you want :)
