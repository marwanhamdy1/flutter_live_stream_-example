import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  final List<String> videoUrls = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', // مثال خفيف
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', // مثال خفيف
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', // مثال خفيف
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', // مثال خفيف
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
  ];
  late final PageController _pageController;
  late final List<VideoPlayerController> _videoControllers;
  late final List<bool> _isLiked;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _videoControllers = videoUrls
        .map((url) => VideoPlayerController.network(url))
        .toList();
    _isLiked = List.generate(videoUrls.length, (_) => false);
    _initializeControllers();
    _pageController.addListener(_onPageChanged);
  }

  Future<void> _initializeControllers() async {
    for (int i = 0; i < _videoControllers.length; i++) {
      await _videoControllers[i].initialize();
      _videoControllers[i].setLooping(true);
      if (i == 0) {
        _videoControllers[i].play();
      }
      setState(() {});
    }
  }

  void _onPageChanged() {
    final int newPage = _pageController.page?.round() ?? 0;
    if (newPage != _currentPage) {
      _videoControllers[_currentPage].pause();
      _videoControllers[newPage].play();
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _videoControllers) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  void _toggleLike(int index) {
    setState(() {
      _isLiked[index] = !_isLiked[index];
    });
  }

  void _onComment() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SizedBox(
        height: 200,
        child: Center(child: Text('Comments coming soon...')),
      ),
    );
  }

  void _onShare() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Share feature coming soon!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          final controller = _videoControllers[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              controller.value.isInitialized
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.value.isPlaying
                              ? controller.pause()
                              : controller.play();
                        });
                      },
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                          width: controller.value.size.width,
                          height: controller.value.size.height,
                          child: VideoPlayer(controller),
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
              // Overlay UI
              Positioned(
                left: 16,
                bottom: 80,
                right: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '@username',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'This is a sample video description. #hashtag',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => _toggleLike(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          _isLiked[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: _isLiked[index] ? Colors.red : Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    IconButton(
                      icon: const Icon(
                        Icons.comment,
                        color: Colors.white,
                        size: 36,
                      ),
                      onPressed: _onComment,
                    ),
                    const SizedBox(height: 16),
                    IconButton(
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 36,
                      ),
                      onPressed: _onShare,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
