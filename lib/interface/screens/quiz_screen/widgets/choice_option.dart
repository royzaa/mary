import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../../../services/quiz_controller.dart';

class ChoiceOption extends StatefulWidget {
  const ChoiceOption({
    Key? key,
    this.scaleTextFactor = 0.25,
    required this.option,
    required this.score,
    required this.answerIndex,
  }) : super(key: key);

  final String option;
  final double scaleTextFactor;
  final int score;
  final int answerIndex;

  @override
  State<ChoiceOption> createState() => _ChoiceOptionState();
}

class _ChoiceOptionState extends State<ChoiceOption> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.find<QuizController>();

    return InkWell(
      onTap: () {
        HapticFeedback.mediumImpact();
        setState(() {
          isTapped = !isTapped;
        });
        if (isTapped == true) {
        } else if (isTapped == false) {}
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
            color: isTapped == false
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(40)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * widget.scaleTextFactor,
          child: Text(
            widget.option,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
