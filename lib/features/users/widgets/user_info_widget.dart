import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size20,
            color: Colors.black,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: Sizes.size12,
          ),
        ),
      ],
    );
  }
}
