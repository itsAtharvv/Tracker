# AI Talent Scout - Server Launcher

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "🚀 STARTING AI TALENT SCOUT SELF-HOSTED SERVER" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

# 1. Check for Python deps
Write-Host "`n[1/3] Checking dependencies..." -ForegroundColor Yellow
pip install -r requirements.txt --quiet

# 2. Check for Cloudflared (The Tunnel)
if (!(Test-Path "cloudflared.exe")) {
    Write-Host "[2/3] cloudflared.exe not found. Downloading..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe" -OutFile "cloudflared.exe"
    Write-Host "✅ Download complete." -ForegroundColor Green
} else {
    Write-Host "[2/3] cloudflared.exe found." -ForegroundColor Green
}

# 3. Launching
Write-Host "`n[3/3] Launching App and Secure Tunnel..." -ForegroundColor Yellow
Write-Host "----------------------------------------------"
Write-Host "IMPORTANT: YOUR SECURE PUBLIC URL WILL APPEAR BELOW" -ForegroundColor Cyan
Write-Host "Look for the link starting with https://..."
Write-Host "----------------------------------------------"

# Launch Streamlit in the background
Start-Process streamlit -ArgumentList "run app.py --server.port 8501 --server.headless true" -WindowStyle Hidden

# Launch Cloudflared in this terminal
.\cloudflared.exe tunnel --url http://localhost:8501
