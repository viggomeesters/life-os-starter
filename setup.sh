#!/bin/bash
# Life OS Starter — macOS Setup
# Run: bash setup.sh

echo ""
echo "=== Life OS Starter Setup ==="
echo ""

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "[0/4] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "[1/4] Installing Git..."
brew install git 2>/dev/null || echo "  Git already installed"

echo "[2/4] Installing Node.js..."
brew install node 2>/dev/null || echo "  Node.js already installed"

echo "[3/4] Installing Obsidian..."
brew install --cask obsidian 2>/dev/null || echo "  Obsidian already installed"

echo "[4/4] Installing Codex CLI..."
npm install -g @openai/codex

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "  1. Set your OpenAI API key:"
echo "     export OPENAI_API_KEY=sk-your-key-here"
echo "     (add this to your ~/.zshrc to make it permanent)"
echo "  2. Open Obsidian → 'Open folder as vault' → select this folder"
echo "  3. Open a terminal in this folder and type: codex"
echo ""
echo "That's it! Ask the agent to create a task, explore your vault, or start a project."
echo ""
