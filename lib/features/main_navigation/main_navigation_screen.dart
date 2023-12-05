import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Record Video'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Container(),
          ),
          Container(),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size2),
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
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Profile",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
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