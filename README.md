# Steam Deck Configs

Day 1 Steam Deck personal configs

## Description

* Echoes SSH status on connect
* SSH alias commands available via ssh_help
* 'll' alias for 'ls -AhF'
* 'lll' alies for 'ls -lAhF'

## Install

* From /home/deck
* nano .bashrc and add content below existing SteamOS defaults
* mkdir .bashrc.d/
* nano .bashrc.d/aliases.sh and copy over all lines
* chmod +600 .bashrc.d/aliases.sh

### Outstanding Bugs

* Serves overall function of echoing SSH status and also starting/stopping.
* Attempted to build in logic so that "ssh_status" would tell you if the sshd service was either "started" (and will stop on reboot) or "enabled" (and would persist) through reboots and that is currently not functioning.
