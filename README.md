# Steam Deck Configs

Day 1 Steam Deck personal configs

## Description

* SSH Status Echo: Instantly know the SSH status upon connection.
* SSH Alias Convenience: Enjoy convenient SSH alias commands accessible through 'ssh_help'.
* Enhanced File Navigation: Simplify file navigation with aliases like 'll' for 'ls -AhF' and 'lll' for 'ls -lAhF'.

## Install

To set up these configurations on your Steam Deck:

Navigate to /home/deck.
* Open .bashrc using your preferred text editor (e.g., nano) and add the provided content below the existing SteamOS defaults.
* Create a directory named .bashrc.d/.
* Copy all lines from aliases.sh into .bashrc.d/aliases.sh.
* Ensure proper permissions by running chmod +600 .bashrc.d/aliases.sh.h

## Current Status and Bugs

* Serves overall function of echoing SSH status and also starting/stopping.
* Attempted to build in logic so that "ssh_status" would tell you if the sshd service was either "started" (and will stop on reboot) or "enabled" (and would persist) through reboots and that is currently not functioning.
