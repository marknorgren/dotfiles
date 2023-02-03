#!/bin/bash

echo "🚀 Setting up SSH access to GitHub 🚀"
echo "================================="
echo ""

echo "🔍 Checking for existing SSH key..."
echo "---------------------------------"
echo ""

hostname=$(hostname | cut -d '.' -f 1)
read -p "🔑 Enter name for the key pair (default: $hostname): " key_name
key_name=${key_name:-$hostname}
if [ -f ~/.ssh/${key_name}.pub ]; then
  echo "SSH key with name ${key_name} already exists."
  echo ""
else
  echo "🔧 Generating a new SSH key..."
  echo "-----------------------------"
  echo ""
  ssh-keygen -t rsa -b 4096 -C "mark@marknorgren.com" -f ~/.ssh/${key_name}
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/${key_name}
  echo "SSH key generated."
  echo ""
fi

echo "📥 Adding the SSH key to your GitHub account..."
echo "-------------------------------------------"
echo "Please add the following public key to your GitHub account:"
echo ""
echo "Key name: ${key_name}"
echo ""
key_value=$(cat ~/.ssh/${key_name}.pub)
echo "$key_value"
echo ""

osascript -e "on run {keyTitle, keyValue}
  tell application \"Safari\"
    activate
    make new document with properties {URL:\"https://github.com/settings/ssh/new\"}
  end tell
end run" "My Key Title" "$key_value"

read -p "💡 Have you added the key to your GitHub account? (y/n): " response
if [ "$response" != "y" ]; then
  echo "Exiting script. Please add the key to your GitHub account and re-run the script."
  exit 1
fi

echo "🔌 Testing the connection to GitHub..."
echo "-------------------------------------"
echo ""
ssh -T git@github.com &> /dev/null
if [ $? -eq 1 ]; then
  echo "❌ Connection to GitHub failed."
  echo ""
else
  echo "✅ Connection to GitHub succeeded."
  echo ""
fi

echo "🎉 Setup complete. 🎉"
echo "===================="
