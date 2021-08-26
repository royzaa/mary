import 'package:flutter/material.dart';

class LabelMenu extends StatelessWidget {
  const LabelMenu({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Text(
        title,
        style:
            TextStyle(color: Colors.white, fontSize: size.width < 330 ? 9 : 12),
      ),
    );
  }
}