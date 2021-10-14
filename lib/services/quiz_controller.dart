import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';

import '../interface/screens/result_screen/result_screen.dart';

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
  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  final RxInt correctAnswer = 0.obs;

  final RxInt wrongAnswer = 0.obs;

  final RxInt skippedQuestion = 0.obs;

  late int _score = 0;
  set score(int score) => _score = score;
  int get score => _score;

  final List<int> _listOfScore = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  List<int> get listOfScore => _listOfScore;
  set setScoreOfListScore(int score) => _listOfScore[_quizIndex] = score;

  late String _lastPracticedTheme;
  set lastPracticedTheme(String title) => _lastPracticedTheme = title;
  String get lastPracticedTheme => _lastPracticedTheme;

// called immediately after widget is allocated memory
  @override
  void onInit() {
    // 30s animation duration
    _animationController =
        AnimationController(duration: const Duration(seconds: 30), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // _animationController.forward()..whenComplete(() => nextQuestion());

    // _pageController = PageController();

    super.onInit();
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

  int _quizIndex = 0;
  set quizIndex(int index) => _quizIndex = index;
  int get quizIndex => _quizIndex;

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

  // pageIndex
  int _pageIndex = 1;
  set pageIndex(int index) => _pageIndex = index;
  int get pageIndex => _pageIndex;

  void nextQuestion() {
    if (_pageIndex != 5) {
      _controller.animateToPage(
        _pageIndex++,
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );

      /// reset the counter
      _animationController.reset();

      /// start it again
      _animationController.forward().whenComplete(() => nextQuestion());
    } else if (_pageIndex == 5) {
      Get.to(
        () => ResultScreen(
          quizIndex: _quizIndex,
        ),
        transition: Transition.fade,
      );
      resetQuestionNumber();
      _animationController.reset();
      // _pageController.addListener(() {
      //   _questionNumber.value = _pageController.page!.round() + 1;
      // });
    }
  }

  void updateTheNumPage(int index) {
    _questionNumber.value = index + 1;
  }

  void resetQuestionNumber() => _questionNumber.value = 1;

  // void disposeController(BuildContext context) {
  //   _pageController.dispose();
  // }
}
