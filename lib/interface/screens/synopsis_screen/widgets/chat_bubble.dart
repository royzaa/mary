import 'dart:math' as math;

import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: size.width * 0.5,
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Transform.rotate(
            angle: math.pi / 2,
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
