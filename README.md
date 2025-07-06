# 🎥 Live Streaming App with Zego

A modern Flutter application for real-time live streaming with interactive features like emoji reactions, chat, and virtual gifts. Built with Zego Live Streaming SDK for seamless cross-platform streaming experience.

## ✨ Features

### 🎬 Live Streaming
- **Host Mode**: Start live streams with camera and microphone
- **Audience Mode**: Join streams as viewers with interactive features
- **Real-time Video/Audio**: High-quality streaming with low latency
- **Screen Sharing**: Share your screen during live sessions

### 🎨 Interactive Features
- **Emoji Reactions**: Send real-time emoji reactions (❤️, 👍, 😀, etc.)
- **Live Chat**: Real-time messaging between host and audience
- **Virtual Gifts**: Send and receive virtual gifts during streams
- **Like System**: Show appreciation with likes and hearts
- **Member List**: See who's watching the stream

### 🎛️ Host Controls
- **Camera Controls**: Switch between front/back cameras
- **Audio Controls**: Mute/unmute microphone
- **Beauty Effects**: Apply filters and beauty enhancements
- **Voice Changer**: Modify your voice in real-time
- **Stream Management**: Start, pause, and end live streams

### 📱 Audience Features
- **Full-screen Mode**: Immersive viewing experience
- **Settings Panel**: Adjust video quality and audio settings
- **Share Functionality**: Share streams on social media
- **Report/Block**: Moderation tools for inappropriate content
- **Picture-in-Picture**: Multi-task while watching streams

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / Xcode
- Zego Cloud Account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/live_streaming.git
   cd live_streaming
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Zego Credentials**
   
   Get your AppID and AppSign from [Zego Console](https://console.zegocloud.com/)
   
   Update `lib/main.dart`:
   ```dart
   const int appID = YOUR_APP_ID;
   const String appSign = 'YOUR_APP_SIGN';
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Platform Support

| Platform | Status | Minimum Version |
|----------|--------|-----------------|
| Android  | ✅     | API 21+         |
| iOS      | ✅     | iOS 13.0+       |

## 🔧 Configuration

### Android Permissions
The app automatically requests necessary permissions:
- Camera access
- Microphone access
- Network access
- Storage access

### iOS Permissions
Required permissions are configured in `Info.plist`:
- Camera usage description
- Microphone usage description
- Local network access

## 🎯 Usage

### Starting a Live Stream
1. Open the app
2. Enter a unique Live ID
3. Tap "Start Live as Host"
4. Grant camera and microphone permissions
5. Begin streaming!

### Joining as Audience
1. Open the app
2. Enter the same Live ID as the host
3. Tap "Join as Audience"
4. Enjoy the stream with interactive features!

### Interactive Features
- **Send Emojis**: Tap the emoji button to send reactions
- **Chat**: Use the chat button to send messages
- **Gifts**: Send virtual gifts to show support
- **Like**: Tap the heart button to like the stream

## 🏗️ Architecture

```
lib/
├── main.dart                 # Main application entry point
├── pages/
│   ├── role_selection.dart   # Host/Audience selection
│   └── live_streaming.dart   # Zego streaming implementation
└── utils/
    └── constants.dart        # App constants and configuration
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  zego_uikit_prebuilt_live_streaming: ^3.14.1
  cupertino_icons: ^1.0.8
```

## 🔐 Security

- AppSign is used for secure authentication
- All network communications are encrypted
- User data is handled securely
- No sensitive information is stored locally

## 🧪 Testing

### Manual Testing
1. **Single Device**: Test host and audience modes separately
2. **Two Devices**: Test real-time interaction between host and audience
3. **Network Testing**: Test with different network conditions

### Test Scenarios
- [ ] Host starts a live stream
- [ ] Audience joins the stream
- [ ] Emoji reactions work properly
- [ ] Chat messages are delivered
- [ ] Virtual gifts are sent/received
- [ ] Camera switching works
- [ ] Audio controls function
- [ ] Stream ends gracefully

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 📊 Performance

- **Latency**: < 200ms for real-time streaming
- **Quality**: Up to 1080p video resolution
- **Concurrent Users**: Supports thousands of viewers
- **Battery**: Optimized for extended streaming sessions

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Zego Cloud](https://www.zegocloud.com/) for the live streaming SDK
- [Flutter Team](https://flutter.dev/) for the amazing framework
- [Material Design](https://material.io/) for the UI components

## 📞 Support

- **Documentation**: [Zego Live Streaming Docs](https://docs.zegocloud.com/)
- **Issues**: [GitHub Issues](https://github.com/yourusername/live_streaming/issues)
- **Email**: your.email@example.com

## 🔗 Links

- **Live Demo**: [Coming Soon]
- **Zego Console**: [https://console.zegocloud.com/](https://console.zegocloud.com/)
- **Flutter Docs**: [https://docs.flutter.dev/](https://docs.flutter.dev/)

---

⭐ **Star this repository if you found it helpful!**

Made with ❤️ using Flutter and Zego Cloud
