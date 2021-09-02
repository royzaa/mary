import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartLearningButton extends StatelessWidget {
  const StartLearningButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        HapticFeedback.mediumImpact();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        primary: const Color.fromRGBO(
          255,
          135,
          127,
          1,
        ),
        shadowColor: const Color.fromRGBO(
          255,
          135,
          127,
          0.25,
        ),
        elevation: 20,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
      ),
      child: Row(
        children: const [
          Text(
            'Start learning',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
