import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/users/widgets/user_info_widget.dart';
import 'package:tiktok_clone/features/users/widgets/user_info_widget2.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  centerTitle: true,
                  title: const Text('Siru'),
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: ColoredBox(
                    color: Colors.white,
                    child: LayoutBuilder(
                      builder: (context, constraints) => constraints.maxWidth <
                              800
                          ? Column(
                              children: [
                                const CircleAvatar(
                                  radius: 50,
                                  foregroundImage: NetworkImage(
                                      'https://avatars.githubusercontent.com/u/123724249?v=4'),
                                  child: Text("Siru"),
                                ),
                                Gaps.v12,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "@siru",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Sizes.size20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Gaps.h5,
                                    FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      size: Sizes.size16,
                                      color: Colors.blue.shade500,
                                    ),
                                  ],
                                ),
                                Gaps.v24,
                                SizedBox(
                                  height: Sizes.size48,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const UserInfoWidget(
                                          num: "37", text: "Following"),
                                      VerticalDivider(
                                        width: Sizes.size32,
                                        indent: Sizes.size10,
                                        endIndent: Sizes.size10,
                                        thickness: Sizes.size1,
                                        color: Colors.grey.shade400,
                                      ),
                                      const UserInfoWidget(
                                          num: "10.5M", text: "Follower"),
                                      VerticalDivider(
                                        width: Sizes.size32,
                                        indent: Sizes.size10,
                                        endIndent: Sizes.size10,
                                        thickness: Sizes.size1,
                                        color: Colors.grey.shade400,
                                      ),
                                      const UserInfoWidget(
                                          num: "194.3M", text: "Likes"),
                                    ],
                                  ),
                                ),
                                Gaps.v14,
                                FractionallySizedBox(
                                  widthFactor: 0.5,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: Sizes.size12,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(Sizes.size4),
                                            ),
                                          ),
                                          child: const Text(
                                            'Follow',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Sizes.size12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Gaps.h4,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Sizes.size8,
                                            vertical: Sizes.size9),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 1),
                                        ),
                                        child: const FaIcon(
                                          FontAwesomeIcons.youtube,
                                          size: Sizes.size20,
                                        ),
                                      ),
                                      Gaps.h4,
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal:
                                              Sizes.size14 + Sizes.size1,
                                          vertical: Sizes.size12,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 1),
                                        ),
                                        child: const FaIcon(
                                          FontAwesomeIcons.caretDown,
                                          size: Sizes.size14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Gaps.v14,
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Sizes.size32,
                                  ),
                                  child: Text(
                                    "All highlights and where to watch live matches on FIFA+",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: Sizes.size12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                Gaps.v14,
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.link,
                                      size: Sizes.size12,
                                      color: Colors.black,
                                    ),
                                    Gaps.h4,
                                    Text(
                                      "https://nomadcoders.co",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Sizes.size12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Gaps.v20,
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const CircleAvatar(
                                          radius: 50,
                                          foregroundImage: NetworkImage(
                                              'https://avatars.githubusercontent.com/u/123724249?v=4'),
                                          child: Text("Siru"),
                                        ),
                                        Gaps.v12,
                                        Row(
                                          children: [
                                            const Text(
                                              "@siru",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: Sizes.size24,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Gaps.h5,
                                            FaIcon(
                                              FontAwesomeIcons.solidCircleCheck,
                                              size: Sizes.size16,
                                              color: Colors.blue.shade500,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Gaps.h72,
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const UserInfoWidget2(
                                              num: "37",
                                              text: "Following",
                                            ),
                                            VerticalDivider(
                                              width: Sizes.size32,
                                              indent: Sizes.size10,
                                              endIndent: Sizes.size10,
                                              thickness: Sizes.size1,
                                              color: Colors.grey.shade400,
                                            ),
                                            const UserInfoWidget2(
                                                num: "10.5M", text: "Follower"),
                                            const VerticalDivider(
                                              width: Sizes.size32,
                                              indent: Sizes.size10,
                                              endIndent: Sizes.size10,
                                              thickness: Sizes.size1,
                                              color: Colors.black,
                                            ),
                                            const UserInfoWidget2(
                                                num: "194.3M", text: "Likes"),
                                          ],
                                        ),
                                        Gaps.v20,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: Sizes.size12,
                                                horizontal: Sizes.size72,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(Sizes.size4),
                                                ),
                                              ),
                                              child: const Text(
                                                'Follow',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Sizes.size18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Gaps.h10,
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Sizes.size10,
                                                      vertical: Sizes.size12),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1),
                                              ),
                                              child: const FaIcon(
                                                FontAwesomeIcons.youtube,
                                                size: Sizes.size24,
                                              ),
                                            ),
                                            Gaps.h10,
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: Sizes.size16,
                                                vertical: Sizes.size12,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1),
                                              ),
                                              child: const FaIcon(
                                                FontAwesomeIcons.caretDown,
                                                size: Sizes.size24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Gaps.v28,
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Sizes.size32,
                                  ),
                                  child: Text(
                                    "All highlights and where to watch live matches on FIFA+",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: Sizes.size18,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                Gaps.v12,
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.link,
                                      size: Sizes.size18,
                                      color: Colors.black,
                                    ),
                                    Gaps.h4,
                                    Text(
                                      "https://nomadcoders.co",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Sizes.size18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Gaps.v20,
                              ],
                            ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: 20,
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth < Breakpoints.md
                          ? 3
                          : constraints.maxWidth < Breakpoints.xl
                              ? 4
                              : 5,
                      crossAxisSpacing: Sizes.size2,
                      mainAxisSpacing: Sizes.size2,
                      childAspectRatio: 9 / 13,
                    ),
                    itemBuilder: (context, index) => Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 13,
                          child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: "assets/images/image1.jpg",
                              image:
                                  "https://cdn.pixabay.com/photo/2023/06/01/05/59/oranges-8032713_1280.jpg"),
                        ),
                        const Positioned(
                          left: Sizes.size6,
                          bottom: Sizes.size3,
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.play,
                                color: Colors.white,
                                size: Sizes.size12,
                              ),
                              Gaps.h8,
                              Text(
                                "4.1M",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size10 + Sizes.size1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        index == 0
                            ? Positioned(
                                top: Sizes.size6,
                                left: Sizes.size4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size4,
                                    vertical: Sizes.size1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(Sizes.size2),
                                    ),
                                  ),
                                  child: const Text(
                                    'Pinned',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Text("Page two"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           // AppBar가 있지만 Scrollable!, 내려가면서 사라짐
//           // floating: true,
//           // stretch: true,
//           snap: true,
//           stretch: true,
//           floating: true,
//           pinned: true,
//           backgroundColor: Colors.teal,
//           collapsedHeight: 80, // 300까지 전부 다 보이고, 스크롤을 내리면 100 부분에서 title이 사라짐!
//           expandedHeight: 200,
//           flexibleSpace: FlexibleSpaceBar(
//             stretchModes: const [
//               StretchMode.blurBackground,
//               StretchMode.zoomBackground,
//             ],
//             background: Image.asset(
//               "assets/images/image1.jpg",
//               fit: BoxFit.cover,
//             ),
//             title: const Text('Hello!'),
//           ),
//         ),
//         const SliverToBoxAdapter(
//           child: Column(
//             children: [
//               CircleAvatar(
//                 backgroundColor: Colors.red,
//                 radius: 20,
//               ),
//             ],
//           ),
//         ),
//         SliverFixedExtentList(
//             delegate: SliverChildBuilderDelegate(
//               childCount: 50,
//               (context, index) => Container(
//                 color: Colors.amber[100 * (index % 9)],
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text("Item $index"),
//                 ),
//               ),
//             ),
//             itemExtent: 100),
//         SliverPersistentHeader(
//           pinned: true,
//           delegate: CustomDelegate(),
//         ),
//         SliverGrid(
//           delegate: SliverChildBuilderDelegate(
//             childCount: 50,
//             (context, index) => Container(
//               color: Colors.blue[100 * (index % 9)],
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text("Item $index"),
//               ),
//             ),
//           ),
//           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 100,
//             mainAxisSpacing: Sizes.size20,
//             crossAxisSpacing: Sizes.size20,
//             childAspectRatio: 1,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CustomDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.indigo,
//       child: const FractionallySizedBox(
//         heightFactor: 1,
//         child: Center(
//           child: Text(
//             'Title!!!!!',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 150;

//   @override
//   double get minExtent => 50;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
}
