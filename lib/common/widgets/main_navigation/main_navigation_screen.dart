import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/videos/views/video_recording_screen.dart';
import 'package:tiktok_clone/features/videos/views/video_timeline_screen.dart';
import 'package:tiktok_clone/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;
  const MainNavigationScreen({super.key, required this.tab});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = ["home", "discover", "xx", "inbox", "profile"];
  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    context.pushNamed(VideoRecordingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false, // 하단 키보드 입력창에 의해 영상이 찌그러지는 걸 방지
      backgroundColor:
          _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Container(),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(
              username: "siru",
              tab: "likes",
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
                selectedIndex: _selectedIndex,
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(inverted: _selectedIndex != 0),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                text: "Profile",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// For iOS
  // @override
  // Widget build(BuildContext context) {
  //   return CupertinoTabScaffold(
  //     tabBar: CupertinoTabBar(
  //       items: const [
  //         BottomNavigationBarItem(
  //           icon: Icon(CupertinoIcons.house),
  //           label: "Home",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(CupertinoIcons.search),
  //           label: "Search",
  //         ),
  //       ],
  //     ),
  //     tabBuilder: (context, index) => screens[index],
  //   );
  // }

// 갤럭시 Material Navigation Bar
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: screens[_selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       type: BottomNavigationBarType.shifting,
  //       currentIndex: _selectedIndex,
  //       onTap: _onTap,
  //       selectedItemColor: Theme.of(context).primaryColor,
  //       items: const [
  //         BottomNavigationBarItem(
  //             icon: FaIcon(FontAwesomeIcons.house),
  //             label: "Home",
  //             tooltip: "What are you?",
  //             backgroundColor: Colors.yellow),
  //         BottomNavigationBarItem(
  //             icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
  //             label: "Search",
  //             tooltip: "What are you?",
  //             backgroundColor: Colors.cyan),
  //         BottomNavigationBarItem(
  //             icon: FaIcon(FontAwesomeIcons.house),
  //             label: "Home",
  //             tooltip: "What are you?",
  //             backgroundColor: Colors.pink),
  //         BottomNavigationBarItem(
  //             icon: FaIcon(FontAwesomeIcons.house),
  //             label: "Home",
  //             tooltip: "What are you?",
  //             backgroundColor: Colors.purple),
  //         BottomNavigationBarItem(
  //             icon: FaIcon(FontAwesomeIcons.house),
  //             label: "Home",
  //             tooltip: "What are you?",
  //             backgroundColor: Colors.deepOrange),
  //       ],
  //     ),
  //   );
  // }