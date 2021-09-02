import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class MyShowCase extends StatelessWidget {
  const MyShowCase({
    Key? key,
    required this.child,
    required this.desc,
    required this.title,
    required this.showCaseKey,
  }) : super(key: key);
  final Widget child;
  final String title;
  final String desc;
  final GlobalKey showCaseKey;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      title: title,
      description: desc,
      showcaseBackgroundColor: Theme.of(context).primaryColor,
      key: showCaseKey,
      animationDuration: const Duration(
        milliseconds: 3000,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white,
      ),
      descTextStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
      child: child,
    );
  }
}
