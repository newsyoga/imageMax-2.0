




#!/bin/sh

# Check if files exist
if [ ! -f "locations.txt" ]; then
  echo "Error: locations.txt not found!"
  exit 1
fi

if [ ! -f "files.txt" ]; then
  echo "Error: files.txt not found!"
  exit 1
fi

# Loop through each location
while IFS= read -r location || [ -n "$location" ]; do
  cd "/Users/shawn/Documents/scripts/imageMax-2.0-main"
  # Create directory if it doesn't exist
  mkdir -p "$location"
  # /Users/shawn/Documents/scripts/imageMax-2.0-main
  # Loop through each file
  while IFS= read -r file || [ -n "$file" ]; do
    if [ -f "$file" ]; then
      cp "$file" "$location/"
      echo "Copied $file to $location/"
    else
      echo "Warning: File not found - $file"
    fi
  done < files.txt

  cd "$location"
  chmod +x *.sh
  ./imagemax.sh

done < locations.txt
