#!/bin/bash

# Install Flutter SDK
FLUTTER_VERSION="stable"
FLUTTER_INSTALL_DIR="$HOME/flutter"

if [ ! -d "$FLUTTER_INSTALL_DIR" ]; then
  echo "Installing Flutter SDK..."
  git clone https://github.com/flutter/flutter.git -b $FLUTTER_VERSION $FLUTTER_INSTALL_DIR
fi

export PATH="$FLUTTER_INSTALL_DIR/bin:$PATH"

# Verify Flutter installation
flutter --version

# Get dependencies
flutter pub get

# Build web
flutter build web --release

