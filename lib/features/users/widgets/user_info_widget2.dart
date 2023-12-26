import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class UserInfoWidget2 extends StatelessWidget {
  const UserInfoWidget2({
    super.key,
    required this.text,
    required this.num,
  });
  final String text;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          num,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size28,
            color: isDarkMode(context) ? Colors.white : Colors.black,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: Sizes.size18,
          ),
        ),
      ],
    );
  }
}
