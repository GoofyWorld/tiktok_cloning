import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();

  final Duration _scrollDuration = const Duration(milliseconds: 150);
  final Curve _scrollCurve = Curves.linear;

  int _itemCount = 4;

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    const Color.fromRGBO(0, 150, 136, 1),
  ];

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve, // animation 종류
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colors.addAll(
        [
          Colors.blue,
          Colors.red,
          Colors.yellow,
          const Color.fromRGBO(0, 150, 136, 1),
        ],
      );
      setState(() {});
    }
    print(page);
  }

  void _onVideoFinished() {
    _pageController.nextPage(duration: _scrollDuration, curve: _scrollCurve);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) => const VideoPost(),
    );
  }
}
