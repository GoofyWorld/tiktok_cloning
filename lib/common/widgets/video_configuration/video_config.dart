import 'package:flutter/material.dart';

class VideoConfig extends ChangeNotifier {
  bool isMuted = false;
  bool isAutoplay = false;

  void toggleIsMuted() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toggleAutoplay() {
    isAutoplay = !isAutoplay;
    notifyListeners();
  }
}



/*
final videoConfig = ValueNotifier(false);

final darkmodeConfig = ValueNotifier(false);
*/


// import 'package:flutter/material.dart';

// class VideoConfigData extends InheritedWidget {
//   final bool autoMute;

//   final void Function() toggleMuted;

//   const VideoConfigData(
//       {super.key,
//       required this.toggleMuted,
//       required this.autoMute,
//       required super.child});

//   static VideoConfigData of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<VideoConfigData>()!;
//   }

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) { 
//     return true;
//   }
// }

// class VideoConfig extends StatefulWidget {
//   final Widget child;
//   const VideoConfig({super.key, required this.child});

//   @override
//   State<VideoConfig> createState() => _VideoConfigState();
// }

// class _VideoConfigState extends State<VideoConfig> {
//   bool autoMute = false;

//   void toggleMuted() {
//     setState(() {
//       autoMute = !autoMute;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return VideoConfigData(
//       toggleMuted: toggleMuted,
//       autoMute: autoMute,
//       child: widget.child,
//     );
//   }
// }






// class VideoConfig extends ChangeNotifier {
//   bool autoMute = true;

//   void toggleAutoMute() {
//     autoMute = !autoMute;
//     notifyListeners();
//   }
// }

// final videoConfig = VideoConfig();