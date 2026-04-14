# AI Talent Scout 🏆

An AI-driven athletic talent assessment application utilizing computer vision to evaluate athletic tests such as Sit-ups and Vertical Jumps directly from your browser.

This project uses Streamlit, MediaPipe, OpenCV, and WebRTC to provide a self-hosted platform securely exposed to the web via Cloudflare Tunnels and STUN/TURN integration using Twilio.

## Features
- **Sit-up Tracker**: Analyze your posture and calculate repetitions in real-time.
- **Vertical Jump Tracker**: Calibrate baseline height automatically and determine maximum vertical leap.
- **Secure Auto-Tunnelling**: Comes with an automated PowerShell script to install dependencies, run the server, and expose it publicly via Cloudflare Tunnels for easy access on any device.
- **TURN Server Support**: Built-in logic to utilize robust Twilio TURN servers.

## Prerequisites
- Windows OS (for `launch_server.ps1` compatibility).
- Python 3.8+ installed and added to PATH.

## Installation and Launch

The easiest way to start the platform securely Exposed to the Internet is to use the provided Windows PowerShell script. 
It auto-installs requirements, downloads the Cloudflare Tunnel executable (if missing), and launches both the Streamlit application and the tunnel safely.

```powershell
.\launch_server.ps1
```

A live public URL (e.g., `https://<random-subdomain>.trycloudflare.com`) will be provided in the terminal which you can use directly on your mobile device.

### Manual Run
If you prefer running locally without the tunnel, just use:
```bash
pip install -r requirements.txt
streamlit run app.py
```

## Environment Variables
If you want to use the application over mobile data connections to bypass NAT firewalls efficiently, you can set the following environments:
- `TWILIO_ACCOUNT_SID`: Your Twilio Account SID.
- `TWILIO_AUTH_TOKEN`: Your Twilio Auth Token.
If provided, the app will auto-configure an enterprise-grade TURN server to route the WebRTC video feeds.
