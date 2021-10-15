import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/quiz_controller.dart';

class CountDown extends StatelessWidget {
  const CountDown({
    Key? key,
    required this.mediaQuery,
    required this.duration,
  }) : super(key: key);

  final Size mediaQuery;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      // timer container
      alignment: Alignment.center,
      height: mediaQuery.height.h * 0.08,
      width: mediaQuery.width.w,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: GetBuilder<QuizController>(
        init: QuizController(),
        builder: (controller) {
          double countDownValue = controller.animation.value;
          // this controller actually for count
          debugPrint(controller.animation.value.toString());
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  // countdown timer container
                  alignment: Alignment.bottomRight,
                  height: mediaQuery.height.h * 0.08,
                  width: (mediaQuery.width.w - 32.h) * countDownValue,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(79, 88, 170, 1),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: mediaQuery.height.h * 0.08,
                width: mediaQuery.width.w,
                child: Row(
                  // the number countdown
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer,
                      color: countDownValue * duration < duration - 10
                          ? Colors.white
                          : Colors.transparent,
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    countDownValue * duration < duration - 10
                        ? Text(
                            '${(duration - countDownValue * duration).round()} sec',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                            ),
                          )
                        : DefaultTextStyle(
                            style: TextStyle(
                              color: Colors.red[200],
                              fontSize: 20.sp,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              pause: const Duration(milliseconds: 200),
                              animatedTexts: [
                                ScaleAnimatedText(
                                  '${(duration - countDownValue * duration).round()} sec',
                                  duration: const Duration(
                                    milliseconds: 800,
                                  ),
                                )
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
