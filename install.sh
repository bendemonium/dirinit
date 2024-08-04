#!/bin/bash

# Define the installation directory
INSTALL_DIR="$HOME/.local/bin"

# Define the dirinit URL
DIRINIT_URL="https://raw.githubusercontent.com/bendemonium/dirinit/main/dirinit"

# Function to update PATH in shell config
update_path_in_config() {
    local config_file="$1"
    echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$config_file"
    echo "Updated $config_file with PATH export"
}

# Create installation directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Download dirinit
echo "Downloading dirinit..."
if curl -sSL "$DIRINIT_URL" -o "$INSTALL_DIR/dirinit"; then
    echo "Successfully downloaded dirinit"
else
    echo "Failed to download dirinit. Please check your internet connection and try again."
    exit 1
fi

# Make dirinit executable
chmod +x "$INSTALL_DIR/dirinit"

# Check if installation directory is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "$INSTALL_DIR is not in your PATH. Updating shell configuration..."
    
    # Determine which shell configuration file to use
    if [ -f "$HOME/.bashrc" ]; then
        update_path_in_config "$HOME/.bashrc"
    elif [ -f "$HOME/.bash_profile" ]; then
        update_path_in_config "$HOME/.bash_profile"
    elif [ -f "$HOME/.zshrc" ]; then
        update_path_in_config "$HOME/.zshrc"
    else
        echo "Could not find a suitable shell configuration file to update."
        echo "Please add the following line to your shell configuration file manually:"
        echo "export PATH=\"\$PATH:$INSTALL_DIR\""
    fi
    
    # Export PATH for current session
    export PATH="$PATH:$INSTALL_DIR"
fi

echo "Installation complete. You can now use dirinit from the command line."
echo "If you've just added $INSTALL_DIR to your PATH, you may need to restart your terminal or run 'source ~/.bashrc' (or equivalent) for the changes to take effect."
