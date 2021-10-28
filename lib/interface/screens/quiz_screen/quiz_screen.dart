import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showcaseview/showcaseview.dart';

import './widgets/quiz_card.dart';
import '../../../services/quiz_controller.dart';
import '../../../data/quizes.dart';
import '../../../services/shared_preferences.dart';
import '../../../model/quiz_item.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz-screen';
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuizScreen> {
  final PageController controller = PageController();
  final QuizController quizController = Get.find<QuizController>();
  late List<FirstQuizItem> displayedQuizOne;
  late List<SecondQuizItem> displayedQuizTwo;
  final _five = GlobalKey();
  int currentIndex = 0;
  @override
  void initState() {
    firstQuiz.quizItemData.shuffle();
    displayedQuizOne = firstQuiz.quizItemData.sublist(0, 5);
    secondQuiz.quizItemData.shuffle();
    displayedQuizTwo = secondQuiz.quizItemData.sublist(0, 5);
    quizController.controller = controller;
    quizController.correctAnswer.value = 0;
    quizController.wrongAnswer.value = 0;

    if (!DataSharedPreferences.getFirstTimeQuiz()!) {
      quizController.animationController
          .forward()
          .whenComplete(() => quizController.nextQuestion());
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (DataSharedPreferences.getFirstTimeQuiz()!) {
        ShowCaseWidget.of(context)!.startShowCase(
          [_five],
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    //  quizController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizNum = ModalRoute.of(context)?.settings.arguments as int;
    final mediaQUery = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        HapticFeedback.vibrate();
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(79, 88, 170, 1),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Obx(
                      () => Text(
                        'Question No. ${quizController.questionNumber.value}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Stack(
                    // question bar
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        width: mediaQUery.width * 0.45,
                        height: 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context).primaryColor),
                      ),
                      Container(
                        width: mediaQUery.width *
                            0.45 *
                            (currentIndex + 1) *
                            1 /
                            5,
                        height: 9.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemCount: quizNum == 1
                          ? displayedQuizOne.length
                          : displayedQuizTwo.length,
                      itemBuilder: (context, index) => QuizCard(
                        index: index,
                        showCaseKey: quizNum == 1
                            ? index == 0
                                ? _five
                                : null
                            : null,
                        mediaQuery: mediaQUery,
                        textStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        question: quizNum == 1
                            ? displayedQuizOne[index].quizQuestion
                            : displayedQuizTwo[index].quizQuestion,
                        option: quizNum == 2
                            ? displayedQuizTwo[index].choices
                            : null,
                        descriptiveText: quizNum == 2
                            ? displayedQuizTwo[index].descriptiveText
                            : null,
                        rightAnswer: quizNum == 1
                            ? displayedQuizOne[index].rightAnswer
                            : null,
                        svgUrl: quizNum == 1
                            ? displayedQuizOne[index].svgUrl
                            : null,
                        controller: controller,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
