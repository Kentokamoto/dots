#!/bin/bash

# Check if better snap tool is installed
# This will prevent windows from being moved to different spaces if they are
# dragged to the edge of a screen
defaults write com.apple.dock workspaces-edge-delay -float 2.0; killall Dock
