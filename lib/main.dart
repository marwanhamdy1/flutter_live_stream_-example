import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'config/zego_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zego Live Streaming',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RoleSelectionPage(),
    );
  }
}

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  final TextEditingController _liveIdController = TextEditingController(
    text: 'test_live',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zego Live Streaming')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter Live ID to join or host a stream:'),
            const SizedBox(height: 16),
            TextField(
              controller: _liveIdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Live ID',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LiveStreamingPage(
                      isHost: true,
                      liveID: _liveIdController.text.trim(),
                    ),
                  ),
                );
              },
              child: const Text('Start Live as Host'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LiveStreamingPage(
                      isHost: false,
                      liveID: _liveIdController.text.trim(),
                    ),
                  ),
                );
              },
              child: const Text('Join as Audience'),
            ),
          ],
        ),
      ),
    );
  }
}

class LiveStreamingPage extends StatelessWidget {
  final bool isHost;
  final String liveID;
  const LiveStreamingPage({
    super.key,
    required this.isHost,
    required this.liveID,
  });

  @override
  Widget build(BuildContext context) {
    // Use ZegoConfig for credentials
    final String userID = isHost
        ? 'host_${DateTime.now().millisecondsSinceEpoch}'
        : 'audience_${DateTime.now().millisecondsSinceEpoch}';
    final String userName = isHost ? 'Host' : 'Audience';

    return Scaffold(
      appBar: AppBar(title: Text(isHost ? 'Host Live' : 'Audience Live')),
      body: ZegoUIKitPrebuiltLiveStreaming(
        appID: ZegoConfig.appID,
        appSign: ZegoConfig.appSign,
        userID: userID,
        userName: userName,
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
