#!/bin/bash
echo "Updating the repository..."
git pull

echo "Removing old public files"
rm -rf public/

echo "Creating new public files"
hugo

echo "Removing old public files"
rm -rf /var/www/felixkirchner.de/public/

echo "Copying new public files"
cp -r public/ /var/www/felixkirchner.de/public/

echo "Restarting nginx..."
sudo systemctl restart nginx

echo "Done!"
