import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/cached_svg.dart';

class QuizBox extends StatelessWidget {
  const QuizBox({
    Key? key,
    required this.isOpen,
    required this.numQuiz,
    required this.imageUrl,
    required this.quizTitle,
  }) : super(key: key);

  final bool? isOpen;
  final int? numQuiz;
  final String? imageUrl;
  final String? quizTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isOpen!) {
          Fluttertoast.showToast(
            msg: 'Quiz currently unavailable',
            gravity: ToastGravity.BOTTOM,
            fontSize: 18.sp,
          );
        } else {
          HapticFeedback.mediumImpact();
          Fluttertoast.showToast(
            msg: 'Complete previous quiz, please',
            gravity: ToastGravity.BOTTOM,
            fontSize: 18.sp,
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 120.h,
              width: 140.w,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(-2, 0),
                    blurRadius: 20,
                    spreadRadius: 2,
                    color: isOpen!
                        ? const Color.fromRGBO(0, 102, 255, 0.15)
                        : Colors.grey.withOpacity(0.15),
                  )
                ],
              ),
              child: isOpen!
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CachedSvg(
                            svgUrl: imageUrl!,
                            width: 110.w,
                          ),
                        ),
                        Text(
                          quizTitle!,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor.withRed(20),
                              fontSize: 14.sp),
                        )
                      ],
                    )
                  : Center(
                      child: Icon(
                        Icons.lock,
                        color: Colors.grey[400]!.withOpacity(0.7),
                        size: 36.r,
                      ),
                    )),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Quiz $numQuiz',
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
