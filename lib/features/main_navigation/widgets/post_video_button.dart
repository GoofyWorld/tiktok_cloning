import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({
    Key? key,
    required this.inverted,
  }) : super(key: key);
  final bool inverted;

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  bool _isLongPressed = false;

  void _onLongPressStart(LongPressStartDetails details) {
    setState(() {
      _isLongPressed = true;
    });
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    setState(() {
      _isLongPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 50),
      opacity: _isLongPressed ? 0.5 : 1,
      child: Transform.scale(
        scale: _isLongPressed ? 1.5 : 1,
        child: GestureDetector(
          onLongPressStart: _onLongPressStart,
          onLongPressEnd: _onLongPressEnd,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 20,
                child: Container(
                  height: 30,
                  width: 25,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
                  decoration: BoxDecoration(
                    color: const Color(0xff61D4F0),
                    borderRadius: BorderRadius.circular(Sizes.size8),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                child: Container(
                  height: 30,
                  width: 25,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(Sizes.size8),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
                height: 30,
                decoration: BoxDecoration(
                  color: widget.inverted ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(Sizes.size6),
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.plus,
                    color: widget.inverted ? Colors.white : Colors.black,
                    size: Sizes.size20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
