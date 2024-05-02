# Alias for better directory listings
alias ll='ls -AhF'
alias lll='ls -lAhF'

# Function for displaying SSH help
ssh_help() {
    echo "SSH Help:"
    echo "  ssh_status: Checks if SSH service is running."
    echo "  ssh_start: Starts SSH service (temporary, until reboot)."
    echo "  ssh_enable: Enables SSH service to start automatically on boot."
    echo "  ssh_stop: Stops and disables SSH service."
    echo ""
    echo "Usage:"
    echo "  ssh_status: Displays current SSH service status."
    echo "  ssh_start: Starts SSH service."
    echo "  ssh_enable: Enables SSH service."
    echo "  ssh_stop: Stops and disables SSH service."
}

# General initialization check to avoid duplicate sourcing (if needed)
if [[ -z "$GENERAL_ALIASES_SOURCED" ]]; then
    export GENERAL_ALIASES_SOURCED=true
fi

# Reset the flag for a new shell session
export BASHRC_SOURCED=false

# Alias to check SSH status
ssh_status() {
    if [[ -z "$BASHRC_SOURCED" ]]; then
        . ~/.bashrc  # Source .bashrc if not already sourced
        export BASHRC_SOURCED=true  # Set flag indicating .bashrc has been sourced
    fi

    # Check if sshd process is running
    if pgrep -x sshd > /dev/null; then
        # Check if the sshd service is enabled to start on boot
        if systemctl is-enabled --quiet sshd; then
            echo "SSH is running and will persist through reboots. Use ssh_stop to stop."
        else
            echo "SSH is running and will not persist through reboots. Use ssh_stop to stop."
        fi
    elif systemctl is-active --quiet sshd; then
        if systemctl is-enabled --quiet sshd; then
            echo "SSH is not running but enabled to start on boot. Use ssh_stop to stop all SSH functions."
        else
            echo "SSH is not running and not enabled to start on boot. Use ssh_help to review SSH aliases."
        fi
    else
        echo "SSH is not running. Use ssh_help for other aliases."
    fi
}

# Alias for starting SSH
alias ssh_start='sudo systemctl start sshd && echo "SSH service started. This will only last until reboot. Use ssh_enable to enable reboot persistence. No need for ssh_stop inbetween." && export BASHRC_SOURCED=true'

# Alias for enabling SSH
alias ssh_enable='sudo systemctl enable --now sshd && echo "SSH service enabled. This will persist through reboots. Use ssh_stop then ssh_start for SSH service until reboot." && export BASHRC_SOURCED=true'

# Alias for disabling SSH
alias ssh_stop='
if pgrep -x sshd > /dev/null; then
    echo "SSH daemon process found. Stopping SSH service."
    sudo systemctl stop sshd &>/dev/null
    echo "SSH service stopped."
    export BASHRC_SOURCED=true  # Set flag indicating manual action has been performed
elif systemctl is-active --quiet sshd; then
    echo "SSH service found to be active. Stopping SSH service."
    sudo systemctl stop sshd &>/dev/null
    echo "SSH service stopped."
    export BASHRC_SOURCED=true  # Set flag indicating manual action has been performed
else
    echo "SSH service is already stopped."
fi
'
