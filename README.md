# AI Talent Scout 🏆

An AI-driven athletic talent assessment application utilizing computer vision to evaluate athletic tests such as Sit-ups and Vertical Jumps directly from your browser.

This project is built using Streamlit, MediaPipe, OpenCV, and WebRTC, designed natively to be deployed on Streamlit Community Cloud.

## Features
- **Live AI Detection**: Uses Google's MediaPipe Tasks API for fast, edge-based pose detection in your browser.
- **Sit-up Tracker**: Analyze your posture and automatically calculate valid repetitions in real-time using hip geometry angles.
- **Vertical Jump Tracker**: Calibrate baseline height dynamically and determine your maximum vertical leap via bounding box extrapolations.
- **Mobile Friendly (WebRTC)**: Easily access the assessment feed via any smartphone or tablet camera.

## Deployment on Streamlit Community Cloud

This repository is pre-configured for seamless deployment.

1. Fork or clone this repository to your GitHub account.
2. Go to [Streamlit Community Cloud](https://share.streamlit.io/).
3. Click "Create app", select your repository, specify `app.py` as your main file.
4. **IMPORTANT**: In "Advanced settings" during setup (or in the App secrets later), you **must** configure your Twilio Environment Variables.

### Twilio TURN Server (Crucial for Mobile Networks)
Standard WebRTC (camera streaming) often fails on mobile data like 4G/5G due to strict NAT firewalls. To bypass this, you need a TURN server. We use Twilio for free robust TURN routing.
Set these in your Streamlit Cloud Secrets:
```toml
TWILIO_ACCOUNT_SID = "your_account_sid_here"
TWILIO_AUTH_TOKEN = "your_auth_token_here"
```

## Running Locally

To run this application locally for testing:

1. Install dependencies:
```bash
pip install -r requirements.txt
```
*(Note: Ensure your Python environment matches the deployment version, ideally Python >= 3.11).*

2. Run the application:
```bash
streamlit run app.py
```

## File Structure

- `app.py`: The core Streamlit application housing the UI, WebRTC connections, and MediaPipe logic.
- `requirements.txt`: Python package requirements (auto-detected by Streamlit Cloud).
- `packages.txt`: System-level dependencies for running headless OpenCV/MediaPipe in Linux cloud environments.
