import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../services/quiz_controller.dart';
import './widgets/result_statistic.dart';
import './widgets/result_card.dart';
import '../../bottom_bar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.quizIndex}) : super(key: key);
  static const routeName = 'Result-Screen';

  final int quizIndex;

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.find<QuizController>();
    final mediaQuery = MediaQuery.of(context).size;
    RxString rating = ''.obs;
    int score = 0;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () {
                    score = quizController.correctAnswer.value * 20;

                    switch (score) {
                      case 40:
                        rating.value = 'Horrible!';
                        break;
                      case 60:
                        rating.value = 'Bad!';
                        break;
                      case 80:
                        rating.value = 'Good!';
                        break;
                      case 100:
                        rating.value = 'Excelent!';
                        break;
                      default:
                        rating.value = 'unknown :(';
                    }
                    return ResultCard(mediaQuery: mediaQuery, score: score);
                  },
                ),
                Obx(
                  () {
                    return ResultStatistic(
                      mediaQuery: mediaQuery,
                      score: score,
                      rating: rating.value,
                      quizController: quizController,
                    );
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 25.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    "Get through",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    // DataSharedPreferences.setListOfScore(
                    //   quizController.listOfScore
                    //       .map(
                    //         (score) => score.toString(),
                    //       )
                    //       .toList(),
                    // );
                    debugPrint('correct:' +
                        quizController.correctAnswer.value.toString());
                    debugPrint(
                        'wrong:' + quizController.wrongAnswer.value.toString());
                    Get.off(
                      ShowCaseWidget(
                        builder: Builder(
                          builder: (context) {
                            return const BottomNavBar();
                          },
                        ),
                      ),
                      curve: Curves.easeInCubic,
                      transition: Transition.cupertino,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
