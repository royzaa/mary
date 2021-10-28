import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:showcaseview/showcaseview.dart';

import '../interface/screens/result_screen/result_screen.dart';
import './shared_preferences.dart';

// this is get package for state management

class QuizController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  // at the time we can access our animation outside
  Animation get animation => _animation;

  AnimationController get animationController => _animationController;

  // // definied the quiz question list
  // final List<List<String>> _quizQuestion = questions;

  // // with get, we can access this list of queston outside
  // List<List<String>> get quizQuestions => _quizQuestion;

  // // definied the quiz option list
  // final List<List<Map<String, List<dynamic>>>> _quizOption = answers;

  // // make the option quiz can accessed from outside
  // List<List<Map<String, List<dynamic>>>> get quizOptions => _quizOption;

  // late PageController _pageController;
  // PageController get pageController => _pageController;

  late int _selectedQuestionIndex;
  int get selectedQuestionIndex => _selectedQuestionIndex;

  // question number counter
  final RxInt questionNumber = 1.obs;

  final RxInt correctAnswer = 0.obs;

  final RxInt wrongAnswer = 0.obs;

  final RxInt skippedQuestion = 0.obs;

// called immediately after widget is allocated memory
  int duration = 1;
  set setDuration(int num) => duration = num;
  @override
  void onReady() {
    // 30s animation duration
    _animationController =
        AnimationController(duration: Duration(seconds: duration), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // _animationController.forward()..whenComplete(() => nextQuestion());

    // _pageController = PageController();

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _controller.dispose();
    _animation.removeListener(() {});
  }
  // controller setter

  late PageController _controller;
  set controller(PageController pageController) => _controller = pageController;

  // submitAnswer({
  //   required int score,
  //   required int answerIndex,
  // }) {
  //   _selectedQuestionIndex = answerIndex;
  //   debugPrint('answerIndex: $answerIndex');
  //   if (_selectedQuestionIndex > -1 && _isAnswered == true) {
  //     debugPrint('submit index: $_selectedQuestionIndex');
  //     debugPrint('submit isAnswered: $_isAnswered');
  //     debugPrint('submit clicked');
  //     _listOfScore[_quizIndex] += score;
  //     if (score > 0) {
  //       _numOfCorrectAnswer++;
  //     }
  //     _numOfUnansweredQuestion--;
  //     _isAnswered = false;
  //     _selectedQuestionIndex = -1;
  //   }

  //   debugPrint('toal nilai saat ini: ${_listOfScore[_quizIndex]}');
  //   debugPrint('nilai saat ini: $score');

  //   _animationController.stop();
  //   update();

  //   Future.delayed(
  //     const Duration(seconds: 0),
  //     () {
  //       nextQuestion();
  //     },
  //   );
  //   score = 0;
  // }

  void nextQuestion() {
    if (questionNumber.value != 5) {
      _controller.animateToPage(
        questionNumber.value++,
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );

      /// reset the counter
      _animationController.reset();

      /// start it again
      _animationController.forward().whenComplete(() => nextQuestion());
    } else if (questionNumber.value == 5) {
      Get.off(
        () => ShowCaseWidget(
          onFinish: () async =>
              await DataSharedPreferences.setFirstTimeResult(false),
          builder: Builder(builder: (context) {
            return const ResultScreen();
          }),
        ),
        transition: Transition.fade,
      );
      resetQuestionNumber();
      _animationController.reset();
    }
  }

  void resetQuestionNumber() => questionNumber.value = 1;
}
