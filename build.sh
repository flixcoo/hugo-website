#!/bin/bash
echo "=== Updating the repository..."
git pull

echo "=== Removing old public files"
rm -rf public/

echo "=== Creating new public files"
hugo

echo "=== Done!"
