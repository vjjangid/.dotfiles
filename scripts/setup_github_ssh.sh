#!/bin/bash

# GitHub noreply email (replace vjjangid with your GitHub username if sharing)
GITHUB_USERNAME="vjjangid"
KEY_COMMENT="${GITHUB_USERNAME}@users.noreply.github.com"
SSH_KEY="$HOME/.ssh/id_ed25519"

# Step 1: Generate SSH key if it doesn't exist
if [ ! -f "$SSH_KEY" ]; then
  echo "🔑 Generating new SSH key..."
  ssh-keygen -t ed25519 -C "$KEY_COMMENT" -f "$SSH_KEY"
else
  echo "✅ SSH key already exists at $SSH_KEY"
fi

# Step 2: Start the ssh-agent in the background
echo "🚀 Starting ssh-agent..."
eval "$(ssh-agent -s)"

# Step 3: Create ~/.ssh/config if it doesn't exist and configure it
echo "⚙️ Configuring SSH config..."
SSH_CONFIG="$HOME/.ssh/config"
if ! grep -q "UseKeychain yes" "$SSH_CONFIG" 2>/dev/null; then
  {
    echo ""
    echo "Host github.com"
    echo "  HostName github.com"
    echo "  User git"
    echo "  IdentityFile $SSH_KEY"
    echo "  UseKeychain yes"
    echo "  AddKeysToAgent yes"
  } >> "$SSH_CONFIG"
  echo "✅ SSH config updated at $SSH_CONFIG"
else
  echo "✅ SSH config already set up"
fi

# Step 4: Add key to macOS keychain
echo "🔐 Adding SSH key to macOS keychain..."
ssh-add --apple-use-keychain "$SSH_KEY"

# Step 5: Copy public key to clipboard
echo "📋 Copying public key to clipboard..."
pbcopy < "${SSH_KEY}.pub"
echo "✅ Public key copied to clipboard — paste it into GitHub → Settings → SSH and GPG keys"

# Done
echo "🎉 SSH setup complete!"
