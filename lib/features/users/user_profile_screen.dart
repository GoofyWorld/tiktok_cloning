import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // AppBar가 있지만 Scrollable!, 내려가면서 사라짐
          backgroundColor: Colors.teal,
          collapsedHeight: 80, // 300까지 전부 다 보이고, 스크롤을 내리면 100 부분에서 title이 사라짐!
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/image1",
              fit: BoxFit.cover,
            ),
            title: const Text('Hello!'),
          ),
        ),
      ],
    );
  }
}
