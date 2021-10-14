import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import './count_down.dart';
import './choice_option.dart';
import '../../../../services/quiz_controller.dart';
import '../../../../services/speech_to_text.dart';
import '../../../widget/my_show_case.dart';

class QuizCard extends StatefulWidget {
  const QuizCard({
    Key? key,
    required this.mediaQuery,
    required this.textStyle,
    required this.question,
    required this.controller,
    required this.showCaseKey,
    this.option,
    this.rightAnswer,
    this.svgUrl,
  }) : super(key: key);

  final Size mediaQuery;
  final TextStyle textStyle;
  final String question;
  final String? rightAnswer, svgUrl;
  final Map? option;
  final PageController controller;
  final GlobalKey? showCaseKey;

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard>
    with SingleTickerProviderStateMixin {
  final QuizController quizController = Get.find<QuizController>();
  late AnimationController _animationController;

  final ValueNotifier<bool> isCorrectAnswer = ValueNotifier(false);
  late ValueNotifier<bool> isAnswered;
  final listeningNotifer = false.obs;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    isAnswered = ValueNotifier(false);
    debugPrint('correct ans:' + quizController.correctAnswer.value.toString());
    debugPrint('wrong ans:' + quizController.wrongAnswer.value.toString());
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isCorrectAnswer.value
            ? quizController.correctAnswer.value += 1
            : quizController.wrongAnswer.value += 1;
        quizController.nextQuestion();

        _animationController.reset();
      }
    });
    SpeechToTextApi.init(onStatus: (status) {
      //  listeningNotifer.value = isListening;
      debugPrint('listening status: $status');
      switch (status) {
        case 'listening':
          listeningNotifer.value = true;
          break;
        case 'notListening':
          listeningNotifer.value = false;
          break;
        case 'done':
          listeningNotifer.value = false;
          break;
        default:
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    // isCorrectAnswer.dispose();
    // isAnswered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // question card container
      width: widget.mediaQuery.width.w,
      height: widget.mediaQuery.height.h * 0.75,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: Colors.white,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: widget.mediaQuery.height,
            width: widget.mediaQuery.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CountDown(
                  mediaQuery: widget.mediaQuery,
                ),
                if (widget.svgUrl != null)
                  SvgPicture.asset(
                    widget.svgUrl!,
                    height: widget.mediaQuery.height.h * 0.18,
                    width: widget.mediaQuery.width.w * 0.75,
                    fit: BoxFit.contain,
                  ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    ),
                    color: const Color.fromRGBO(255, 187, 187, 1),
                    child: Text(
                      '20 points',
                      style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                SizedBox(
                  width: widget.mediaQuery.width - 32 - 40,
                  child: Text(
                    widget.question,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                if (widget.rightAnswer != null)
                  GestureDetector(
                    onTapUp: (details) {
                      listeningNotifer.value = false;
                      SpeechToTextApi.stopListen();
                    },
                    onTapDown: (details) async {
                      listeningNotifer.value = true;
                      // Timer(
                      //   const Duration(milliseconds: 1900),
                      //   () {
                      //     debugPrint('error timer');
                      //     SpeechToTextApi.stopListen();
                      //     listeningNotifer.value = false;
                      //   },
                      // );

                      SpeechToTextApi.startListen(
                        onResult: (result) {
                          if (result.isNotEmpty) {
                            isCorrectAnswer.value =
                                result.toLowerCase() == widget.rightAnswer;

                            isAnswered.value = true;
                            // Future.delayed(
                            //   const Duration(milliseconds: 500),
                            //   () {
                            //     if (quizController.questionNumber.value == 1) {
                            //       debugPrint(
                            //         'answered? no 1: ' +
                            //             isAnswered.value.toString(),
                            //       );
                            //       isCorrectAnswer.value
                            //           ? quizController.correctAnswer.value++
                            //           : quizController.wrongAnswer.value++;
                            //     }
                            //   },
                            // );

                            _animationController.forward();
                            debugPrint('hasil: $result');
                            if (!isCorrectAnswer.value) {
                              HapticFeedback.mediumImpact();
                            }
                          }
                        },
                      );
                    },
                    child: Obx(
                      () {
                        debugPrint(
                            'hasil bool:' + listeningNotifer.value.toString());
                        return AvatarGlow(
                          duration: const Duration(milliseconds: 800),
                          endRadius: 100.r,
                          animate: listeningNotifer.value,
                          glowColor: Theme.of(context).primaryColor,
                          child: MyShowCase(
                            title: 'Say a word here',
                            desc:
                                'Hold on this mic button and speak the correct vehicle prounonciation',
                            showCaseKey: widget.showCaseKey,
                            child: Container(
                              padding: EdgeInsets.all(15.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
                                boxShadow: listeningNotifer.value
                                    ? [
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.4),
                                          blurRadius: 35,
                                          offset: const Offset(0, 20),
                                          spreadRadius: 3,
                                        ),
                                      ]
                                    : null,
                              ),
                              child: listeningNotifer.value
                                  ? Icon(
                                      Icons.mic,
                                      color: Colors.white,
                                      size: 36.r,
                                    )
                                  : Icon(
                                      Icons.mic_none,
                                      color: Colors.white,
                                      size: 36.r,
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (widget.option != null)
                  SizedBox(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ChoiceOption(
                              answerIndex: 0,
                              scaleTextFactor:
                                  widget.mediaQuery.height > 600 ? 0.17 : 0.14,
                              option: widget.option!["jawaban"][0],
                              score: widget.option!["score"][0],
                            ),
                            ChoiceOption(
                              answerIndex: 1,
                              scaleTextFactor:
                                  widget.mediaQuery.height > 600 ? 0.17 : 0.14,
                              option: widget.option!["jawaban"][1],
                              score: widget.option!["score"][1],
                            ),
                            ChoiceOption(
                              answerIndex: 2,
                              scaleTextFactor:
                                  widget.mediaQuery.height > 600 ? 0.17 : 0.14,
                              option: widget.option!["jawaban"][2],
                              score: widget.option!["score"][2],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChoiceOption(
                              answerIndex: 3,
                              option: widget.option!["jawaban"][3],
                              score: widget.option!["score"][3],
                            ),
                            ChoiceOption(
                              answerIndex: 4,
                              option: widget.option!["jawaban"][4],
                              score: widget.option!["score"][4],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                // submit button
                if (widget.option != null)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          offset: const Offset(0, 10),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 35.w),
                        ),
                        child: Text(
                          'Submit',
                          style: widget.textStyle,
                        ),
                        onPressed: () {}),
                  ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
          if (widget.rightAnswer != null)
            ValueListenableBuilder(
              valueListenable: isAnswered,
              builder: (context, bool isAnswered, _) {
                return isAnswered
                    ? ValueListenableBuilder(
                        valueListenable: isCorrectAnswer,
                        builder: (context, bool isCorrect, _) {
                          return LottieBuilder.asset(
                            isCorrect
                                ? 'assets/images/done.json'
                                : 'assets/images/failed.json',
                            height: widget.mediaQuery.height.h * 0.4,
                            width: widget.mediaQuery.width.w * 0.8,
                            controller: _animationController,
                          );
                        },
                      )
                    : const SizedBox();
              },
            ),
        ],
      ),
    );
  }
}
