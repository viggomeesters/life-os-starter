# Life OS Starter — Windows Setup
# Run: powershell -ExecutionPolicy Bypass -File setup.ps1

Write-Host ""
Write-Host "=== Life OS Starter Setup ===" -ForegroundColor Cyan
Write-Host ""

# Check winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: winget not found. Install App Installer from Microsoft Store." -ForegroundColor Red
    exit 1
}

# Install dependencies
Write-Host "[1/4] Installing Git..." -ForegroundColor Yellow
winget install -e --id Git.Git --accept-package-agreements --accept-source-agreements

Write-Host "[2/4] Installing Node.js..." -ForegroundColor Yellow
winget install -e --id OpenJS.NodeJS.LTS --accept-package-agreements --accept-source-agreements

Write-Host "[3/4] Installing Obsidian..." -ForegroundColor Yellow
winget install -e --id Obsidian.Obsidian --accept-package-agreements --accept-source-agreements

# Refresh PATH for this session
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "[4/4] Installing Codex CLI..." -ForegroundColor Yellow
npm install -g @openai/codex

Write-Host ""
Write-Host "=== Setup Complete ===" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Close and reopen your terminal (so PATH updates take effect)"
Write-Host "  2. Set your OpenAI API key:"
Write-Host "     setx OPENAI_API_KEY sk-your-key-here" -ForegroundColor White
Write-Host "  3. Open Obsidian -> 'Open folder as vault' -> select this folder"
Write-Host "  4. Open a terminal in this folder and type: codex"
Write-Host ""
Write-Host "That's it! Ask the agent to create a task, explore your vault, or start a project."
Write-Host ""
