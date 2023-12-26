// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

final tabs = ["Top", "Users", "Videos", "Sounds", "LIVE", "Shopping", "Brands"];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  bool _isWriting = false;
  late final TextEditingController _textEditingController;
  late final TabController _tabController;
// CupertinoTextField에 initial text를 설정하려면 Controller를 선언해야 함

  // void _onSearchChanged(String value) {
  //   print(value);
  // }

  // void _onSearchSubmitted(String value) {
  //   print(value);
  // }

  @override
  void initState() {
    super.initState();
    _isWriting = false;
    _textEditingController = TextEditingController();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onClearTapped() {
    _textEditingController.clear();
    setState(() {
      _isWriting = false;
    });
  }

  void _onTextChanged(String text) {
    setState(() {
      text.isNotEmpty ? _isWriting = true : _isWriting = false;
    });
  }

  void _onTapbarTapped(int num) {
    FocusScope.of(context).unfocus();
    setState(() {
      _tabController.index = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Container(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: TextField(
              controller: _textEditingController,
              onChanged: _onTextChanged,
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(
                color: isDarkMode(context) ? Colors.white : Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: isDarkMode(context)
                    ? Colors.grey.shade600
                    : Colors.grey.shade300,
                focusColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(Sizes.size12),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: Sizes.size11,
                    left: Sizes.size16,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: isDarkMode(context)
                        ? Colors.grey.shade300
                        : Colors.black,
                  ),
                ),
                suffixIcon: _isWriting
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: Sizes.size12,
                          right: Sizes.size6,
                        ),
                        child: GestureDetector(
                          onTap: _onClearTapped,
                          child: const FaIcon(FontAwesomeIcons.solidCircleXmark,
                              color: Colors.black45),
                        ),
                      )
                    : null,
              ),
            ),
          ),
          // CupertinoSearchTextField(
          //   controller: _textEditingController,
          //   onChanged: _onSearchChanged,
          //   onSubmitted: _onSearchSubmitted,
          // )
          bottom: TabBar(
            controller: _tabController,
            onTap: _onTapbarTapped,
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: Sizes.size16,
            ),
            tabs: [for (var tab in tabs) Tab(text: tab)],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size6, vertical: Sizes.size6),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.md ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 21,
              ),
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraints) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size4),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/image1.jpg",
                            image:
                                "https://cdn.pixabay.com/photo/2023/06/01/05/59/oranges-8032713_1280.jpg"),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "This is a very long caption for my tiktok that I am uploading just now currently.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gaps.v8,
                    if (constraints.maxWidth < 200 ||
                        constraints.maxWidth > 250)
                      DefaultTextStyle(
                        style: TextStyle(
                          color: isDarkMode(context)
                              ? Colors.grey.shade300
                              : Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/123724249?s=96&v=4"),
                            ),
                            Gaps.h4,
                            const Expanded(
                              child: Text(
                                "Goofy_Seong_Avatar_BlahBlah_OkOK",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            const Text(
                              "2.5M",
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              // Image.asset("assets/images/image1.jpg"), // 넷 상 이미지를 불러올꺼면 Image.network() 이용
            ),
            for (var tab
                in tabs.skip(1)) // Top 탭만 그리드로 갈 거라 따로 사용하는 위젯이 있어서 스킵 처리
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
