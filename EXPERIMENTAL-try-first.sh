#!/bin/bash

# Define the dotfiles directory and an array of files/folders to symlink
DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES=(".zshrc" ".gitconfig" "nvim")

# Function to create a symbolic link
create_symlink() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ]; then
        if [ -L "$dest" ]; then
            echo "Symlink already exists for $dest"
        else
            echo "Backing up existing $dest"
            mv "$dest" "${dest}.backup"
            ln -s "$src" "$dest"
            echo "Created symlink for $dest"
        fi
    else
        ln -s "$src" "$dest"
        echo "Created symlink for $dest"
    fi
}

# Main script execution
echo "Creating symlinks..."

for file in "${DOTFILES[@]}"; do
    if [ "$file" = "nvim" ]; then
        # Special case for nvim folder
        src="$DOTFILES_DIR/$file"
        dest="$HOME/.config/$file"
    else
        src="$DOTFILES_DIR/$file"
        dest="$HOME/$file"
    fi

    create_symlink "$src" "$dest"
done

echo "Symlink creation complete!"