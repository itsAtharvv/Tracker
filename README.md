# Trackr AI - Athletic Talent Scout 🏆

Welcome to **Trackr AI**, a cutting-edge, self-hosted athletic assessment web application. Originally conceived as a tool to democratize high-level athletic scouting, Trackr AI turns any standard web browser into a professional-grade motion analysis laboratory. By utilizing Google's modern MediaPipe computer vision algorithms, it performs live, edge-based evaluations of complex physical movements directly through your device's camera.

---

## 🚀 Core Features

### 1. Real-Time Pose Estimation Engine
Trackr utilizes the highly optimized **MediaPipe Tasks Vision API** to deliver fluid, seamless pose landmarker detection.
- **Edge Deployment**: Heavy computational analysis is done directly on the video frames using advanced vector tracking.
- **Dynamic Joint Mapping**: Instant identification of skeletal landmarks like knees, hips, and shoulders, ensuring highly accurate tracking geometry even in sub-optimal lighting.

### 2. Live Sit-Up Assessment 
Perfect for military, police, or athletic evaluations, the application features an automated sit-up repetition counter.
- **Mathematical Validation**: Uses proprietary hip-hinge vector calculations to map out the 2D Euclidean angle between the user's Shoulder (Vertex A), Hip (Vertex B), and Knee (Vertex C).
- **Strict State Constraints**: A repetition is strictly counted only when the user transitions effectively from an extended resting position (> 150°) down to a fully crunched active position (< 50°). 
- **Oversized Metrics Display**: Vibrant, high-contrast, broadcast-style telemetry overlaid natively onto the video feed.

### 3. Vertical Jump Analyzer
A sophisticated tool designed to measure raw explosive athletic power using spatial displacement algorithms.
- **Adaptive Auto-Calibration**: The tracker maps your standing bodily proportions (measuring the eye-to-heel pixel distance) across a mandatory 30-frame still-period. This establishes an environment-agnostic height ratio.
- **Dynamic Displacement Tracking**: Tracks the exact minimum Y-coordinate achieved by the mid-hip point during the apex of the jump, translating pixel displacement mathematically into exact real-world centimeters.

### 4. Enterprise-Grade WebRTC Connectivity
Deployments involving camera feeds commonly fail on restrictive mobile networks (4G/5G). Trackr bypasses harsh NAT firewalls using seamless WebRTC STUN/TURN routing.
- Automatically handles fallback routing via robust external Twilio TURN servers.
- Maintains ultra-low latency streams across unpredictable cellular bands.

---

## 🛠 Technology Stack
- **Frontend / Engine**: [Streamlit](https://streamlit.io/) — Serves the interactive dashboard and manages reactive states.
- **Real-Time Video**: [streamlit-webrtc](https://github.com/whitphx/streamlit-webrtc) — Facilitates sub-second peer-to-peer camera routing.
- **Computer Vision**: [MediaPipe](https://ai.google.dev/edge/mediapipe/solutions/guide) / [OpenCV](https://opencv.org/) — Analyzes video frames on a granular pixel level using the lightweight `pose_landmarker_lite.task` model.

---

## 🌐 Deploying the Platform

Trackr is optimized to be deployed instantly via **Streamlit Community Cloud** (free hosting).

1. Fork or clone this repository to your GitHub account.
2. Go to [Streamlit Community Cloud](https://share.streamlit.io/) and select "Create app".
3. Point it to this repository, specifying `app.py` as your main file.

### Configuring Mobile Network Support (Twilio)
To ensure smartphone users can access your application over their mobile data, you **must** configure Twilio TURN routing. 
In your Streamlit Cloud **App Secrets** (or standard environment variables), define:
```toml
TWILIO_ACCOUNT_SID = "your_twilio_account_sid"
TWILIO_AUTH_TOKEN = "your_twilio_auth_token"
```

---

## 💻 Local Development

If you prefer to debug, test, or experiment locally:

1. Clone the repository and install the strict dependencies:
```bash
pip install -r requirements.txt
```
*(Note for Linux/Cloud users: You may need to review `packages.txt` for headless OS dependencies like `libglib` or `libgl1`)*

2. Boot the interface:
```bash
streamlit run app.py
```
*(Access via `http://localhost:8501`)*
