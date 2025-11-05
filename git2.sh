#!/bin/bash


User="sarthakk123"


read -p "Enter repository name (e.g. FDS): " Repo


read -p "Enter branch name (default: main): " Branch
if [ -z "$Branch" ]; then
  Branch="main"
fi

read -p "Enter file name (example: FDS 1 or folder/file.txt): " FileName


FileUrl="https://raw.githubusercontent.com/$User/$Repo/refs/heads/$Branch/$FileName"


echo
echo "Fetching from: $FileUrl"
echo

Response=$(curl -fsSL "$FileUrl" 2>/dev/null)

if [ $? -eq 0 ]; then
  echo "----- FILE CONTENT START -----"
  echo "$Response"
  echo "----- FILE CONTENT END -----"
else
  echo "❌ Error fetching file. Please check repository, branch, or file name."
fi
