#!/bin/bash

User="sarthakk123"
Branch="main"
# Prompt for repository name
read -p "Enter repository name (e.g. FDS): " Repo

# Prompt for branch name with a default value of 'main'


# Prompt for file or folder name
read -p "Enter file name (example: FDS 1 or folder/file.txt): " FileName

# Construct the file URL
FileUrl="https://raw.githubusercontent.com/$User/$Repo/refs/heads/$Branch/$FileName"

# Display the URL being fetched from
echo
echo "Fetching from: $FileUrl"
echo

# Fetch the content from the URL
Response=$(curl -fsSL "$FileUrl" 2>/dev/null)

# Check if the request was successful
if [ $? -eq 0 ]; then
  echo "----- FILE CONTENT START -----"
  echo "$Response"
  echo "----- FILE CONTENT END -----"
else
  echo "❌ Error fetching file. Please check repository, branch, or file name."
fi
