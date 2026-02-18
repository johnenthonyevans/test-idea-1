#!/bin/bash

# Script to create a proper Xcode project for RandomNumberApp

echo "Creating Xcode project for RandomNumberApp..."

# Check if xcrun is available
if ! command -v xcrun &> /dev/null; then
    echo "Error: Xcode command line tools not found."
    echo "Please install Xcode and run: xcode-select --install"
    exit 1
fi

# Create a temporary directory for the new project
TEMP_DIR=$(mktemp -d)
echo "Using temporary directory: $TEMP_DIR"

# Use swift package to initialize a proper structure
cd "$TEMP_DIR"

# Create a basic iOS app using the proper Xcode template
# This requires Xcode to be installed
echo "Creating iOS app with xcrun..."

# Check if we're already in the right directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# If Xcode is installed, open it to create the project manually
echo ""
echo "=============================================="
echo "Manual Setup Required"
echo "=============================================="
echo ""
echo "To create a working Xcode project:"
echo ""
echo "1. Open Xcode"
echo "2. File > New > Project"
echo "3. Choose iOS > App"
echo "4. Set Product Name to: RandomNumberApp"
echo "5. Set Interface to: SwiftUI"
echo "6. Set Language to: Swift"
echo "7. Save the project to: $SCRIPT_DIR"
echo ""
echo "8. Replace the generated files with:"
echo "   - RandomNumberApp/RandomNumberAppApp.swift"
echo "   - RandomNumberApp/ContentView.swift"
echo ""
echo "9. Build and run!"
echo ""
echo "=============================================="
echo ""
echo "The Swift source files are already created and ready to use."
echo "They are located in: $SCRIPT_DIR/RandomNumberApp/"
echo ""

# Try to open Xcode if available
if command -v open &> /dev/null; then
    echo "Would you like to open Xcode now? (y/n)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        open -a Xcode
    fi
fi
