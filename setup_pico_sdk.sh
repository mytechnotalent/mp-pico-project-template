#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting setup for Raspberry Pi Pico development on Mac M1..."

# Uninstall existing arm-none-eabi-gcc if it's installed
echo "Uninstalling existing arm-none-eabi-gcc (if installed)..."
brew list arm-none-eabi-gcc &>/dev/null && brew uninstall arm-none-eabi-gcc || echo "arm-none-eabi-gcc not installed, skipping."

# Install gcc-arm-embedded via Homebrew Cask
echo "Installing gcc-arm-embedded via Homebrew Cask..."
if ! brew install --cask gcc-arm-embedded; then
  echo "Installation encountered an error. Attempting to resolve..."

  # If there is an error about existing binaries, perform autoremove
  echo "Running brew autoremove to clean up unneeded packages..."
  brew autoremove

  # Attempt to install gcc-arm-embedded again
  echo "Retrying installation of gcc-arm-embedded..."
  brew install --cask gcc-arm-embedded
fi

echo "gcc-arm-embedded installation completed successfully!"

# Verify installation
echo "Verifying installation..."
if arm-none-eabi-gcc --version &>/dev/null; then
  echo "arm-none-eabi-gcc is installed:"
  arm-none-eabi-gcc --version
else
  echo "Error: arm-none-eabi-gcc is not installed properly."
  exit 1
fi

# Set up Pico SDK
PICO_DIR="$HOME/pico"
echo "Creating Pico directory at $PICO_DIR..."
mkdir -p "$PICO_DIR"
cd "$PICO_DIR"

# Clone the Pico SDK repository
if [ ! -d "$PICO_DIR/pico-sdk" ]; then
  echo "Cloning the Pico SDK..."
  git clone -b master https://github.com/raspberrypi/pico-sdk.git
else
  echo "Pico SDK already exists. Skipping clone."
fi

# Add the PICO_SDK_PATH environment variable to .zshrc
if ! grep -q "export PICO_SDK_PATH=$PICO_DIR/pico-sdk" ~/.zshrc; then
  echo "Adding PICO_SDK_PATH to ~/.zshrc..."
  echo "export PICO_SDK_PATH=$PICO_DIR/pico-sdk" >> ~/.zshrc
  echo "Environment variable added to ~/.zshrc."
else
  echo "PICO_SDK_PATH already set in ~/.zshrc."
fi

# Source the updated .zshrc
echo "Updating current shell with new environment variables..."
source ~/.zshrc

echo "Setup complete! You can now proceed with building your Raspberry Pi Pico projects."
