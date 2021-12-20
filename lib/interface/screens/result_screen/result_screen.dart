import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../services/quiz_controller.dart';
import './widgets/result_statistic.dart';
import './widgets/result_card.dart';
import '../../bottom_bar.dart';
import '../../../services/audio_player_controller.dart';
import '../../../data/quizes.dart';
import '../../../services/shared_preferences.dart';
import '../../widget/share_card.dart';
import '../../widget/my_show_case.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = 'Result-Screen';

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final GlobalKey _six = GlobalKey();
  @override
  void initState() {
    if (DataSharedPreferences.getFirstTimeResult()!) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        ShowCaseWidget.of(context)!.startShowCase([_six]);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuizController quizController = Get.find<QuizController>();
    final audioPlayer = Get.find<AudioPlayerController>();
    final mediaQuery = MediaQuery.of(context).size;
    RxString rating = ''.obs;
    int score = quizController.correctAnswer.value * 20;
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
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          highlightElevation: 0,
          onPressed: () async {
            await createCard().then((success) {
              if (success) {
                final dir = Directory.systemTemp;
                Share.shareFiles(['${dir.path}/card.png'],
                    text:
                        'Hi, I have tried Mary. It\'s pretty fun to learn with Mary. You can download Mary at ... . Enjoy the journey with me.');
              }
            });
          },
          child: MyShowCase(
            showCaseKey: _six,
            desc: 'Tap here to share your accomplishment',
            title: 'Share',
            child: Icon(
              Icons.share,
              size: 28.r,
              color: Colors.white,
            ),
          ),
          autofocus: true,
        ),
        body: Stack(
          children: [
            SafeArea(
              child: ShareCard(score: score),
            ),
            SafeArea(
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ResultCard(mediaQuery: mediaQuery, score: score),
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
                        primary: Colors.white,
                        elevation: 20,
                        onPrimary: Theme.of(context).primaryColor,
                        shadowColor:
                            Theme.of(context).primaryColor.withOpacity(0.4),
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 25.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        "Back to home",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
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
                        debugPrint('wrong:' +
                            quizController.wrongAnswer.value.toString());
                        if (!secondQuiz.isOpen) {
                          secondQuiz.isOpen = true;
                          DataSharedPreferences.setQuizTwoUnlocked(true);
                        }
                        final tempQuizData =
                            DataSharedPreferences.getQuizTracking();
                        tempQuizData.add(score);
                        DataSharedPreferences.setQuizTracking(tempQuizData);
                        Get.off(
                          () => ShowCaseWidget(
                            builder: Builder(
                              builder: (context) {
                                return const BottomNavBar();
                              },
                            ),
                          ),
                          routeName: BottomNavBar.routeName,
                          curve: Curves.easeInCubic,
                          transition: Transition.cupertino,
                        );
                        audioPlayer.resume();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
