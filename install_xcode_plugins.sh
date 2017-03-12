#!/bin/bash
mkdir -p ~/Library/Application\ Support/Developer/Shared/Xcode
cp -r ./Plug-ins ~/Library/Application\ Support/Developer/Shared/Xcode
find ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins -name Info.plist -maxdepth 3 | xargs -I{} defaults write {} DVTPlugInCompatibilityUUIDs -array-add `defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID`
sudo xcode-select --reset
update_xcode_plugins