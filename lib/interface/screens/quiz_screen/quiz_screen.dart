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
  late List<ThirdAndFourthQuizItem> displayQuizThree;
  late List<ThirdAndFourthQuizItem> displayQuizFour;
  final _five = GlobalKey();
  int currentIndex = 0;
  @override
  void initState() {
    firstQuiz.quizItemData.shuffle();
    displayedQuizOne = firstQuiz.quizItemData.sublist(0, 5);
    secondQuiz.quizItemData.shuffle();
    displayedQuizTwo = secondQuiz.quizItemData.sublist(0, 5);
    thirdQuiz.quizItemData.shuffle();
    displayQuizThree = thirdQuiz.quizItemData.sublist(0, 5);
    fourthQuiz.quizItemData.shuffle();
    displayQuizFour = fourthQuiz.quizItemData.sublist(0, 5);

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
    final mediaQuery = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        HapticFeedback.vibrate();
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(79, 88, 170, 1),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: mediaQuery.height - MediaQuery.of(context).padding.top,
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: mediaQuery.width,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
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
                          if (quizNum == 1)
                            Positioned(
                              top: 5.h,
                              left: 16.w,
                              child: InkWell(
                                onTap: showHint,
                                child: Icon(
                                  Icons.error_outline_outlined,
                                  color: Colors.white54,
                                  size: 28.r,
                                ),
                              ),
                            ),
                        ],
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
                          width: mediaQuery.width * 0.45,
                          height: 6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).primaryColor),
                        ),
                        Container(
                          width: mediaQuery.width *
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
                        itemCount: 5,
                        itemBuilder: (context, index) => QuizCard(
                          isEssay: quizNum == 3
                              ? displayQuizThree[index].isEssay
                              : quizNum == 4
                                  ? displayQuizFour[index].isEssay
                                  : false,
                          index: index,
                          quizNum: quizNum,
                          showCaseKey: quizNum == 1
                              ? index == 0
                                  ? _five
                                  : null
                              : null,
                          mediaQuery: mediaQuery,
                          textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          question: quizNum == 1
                              ? displayedQuizOne[index].quizQuestion
                              : quizNum == 2
                                  ? displayedQuizTwo[index].quizQuestion
                                  : quizNum == 3
                                      ? displayQuizThree[index].quizQuestion
                                      : displayQuizFour[index].quizQuestion,
                          option: quizNum == 2
                              ? displayedQuizTwo[index].choices
                              : quizNum == 3
                                  ? displayQuizThree[index].choices
                                  : quizNum == 4
                                      ? displayQuizFour[index].choices
                                      : null,
                          descriptiveTextorNaration: quizNum == 2
                              ? displayedQuizTwo[index].descriptiveText
                              : quizNum == 3
                                  ? displayQuizThree[index].naration
                                  : quizNum == 4
                                      ? displayQuizFour[index].naration
                                      : null,
                          rightAnswer: quizNum == 1
                              ? displayedQuizOne[index].rightAnswer
                              : null,
                          correctAnswerForEssay: quizNum == 3
                              ? displayQuizThree[index].correctAnswerForEssay
                              : quizNum == 4
                                  ? displayQuizFour[index].correctAnswerForEssay
                                  : null,
                          svgUrl: quizNum == 1
                              ? displayedQuizOne[index].svgUrl
                              : null,
                          imageUrl: quizNum == 4
                              ? displayQuizFour[index].questionImage
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
      ),
    );
  }

  void showHint() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Tips',
          style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
        ),
        content: const Text(
          "Hold on mic button and speak the correct vehicle pronunciation.",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "I understand",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
