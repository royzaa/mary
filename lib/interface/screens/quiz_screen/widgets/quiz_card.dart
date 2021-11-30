import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../services/shared_preferences.dart';
import './count_down.dart';
import '../../../../services/quiz_controller.dart';
import '../../../../services/speech_to_text.dart';
import '../../../widget/my_show_case.dart';
import '../../../../model/choice_chip.dart' as choice;

class QuizCard extends StatefulWidget {
  const QuizCard({
    Key? key,
    required this.mediaQuery,
    required this.textStyle,
    required this.question,
    required this.controller,
    required this.showCaseKey,
    required this.index,
    this.option,
    this.descriptiveText,
    this.rightAnswer,
    this.svgUrl,
  }) : super(key: key);

  final Size mediaQuery;
  final TextStyle textStyle;
  final String question;
  final String? rightAnswer, svgUrl, descriptiveText;
  final List<choice.ChoiceChip>? option;
  final PageController controller;
  final GlobalKey? showCaseKey;
  final int index;

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard>
    with SingleTickerProviderStateMixin {
  final QuizController quizController = Get.find<QuizController>();
  late AnimationController _animationController;

  final ValueNotifier<bool> isCorrectAnswer = ValueNotifier(false);
  late ValueNotifier<bool> isAnswered;
  late List<choice.ChoiceChip> shuffledChoices;
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
        if (isCorrectAnswer.value) {
          quizController.correctAnswer.value += 1;
          if (widget.svgUrl != null) {
            // first quiz
            final tempBlockScores =
                DataSharedPreferences.getFirstQuizCompletion();
            if (tempBlockScores[widget.index] == 0) {
              tempBlockScores[widget.index] = 20;
              DataSharedPreferences.setFirstQuizCompletion(tempBlockScores);
              debugPrint('block score 1' + tempBlockScores.toString());
            }
          }
        } else {
          quizController.wrongAnswer.value += 1;
        }

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

    if (widget.option != null) {
      widget.option!.shuffle();
      shuffledChoices = widget.option!;
    }

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
                  duration: widget.rightAnswer != null ? 30 : 45,
                  mediaQuery: widget.mediaQuery,
                ),
                if (widget.svgUrl != null)
                  SvgPicture.asset(
                    widget.svgUrl!,
                    height: widget.mediaQuery.height.h * 0.18,
                    width: widget.mediaQuery.width.w * 0.75,
                    fit: BoxFit.contain,
                  ),
                if (widget.descriptiveText != null)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          const Color.fromRGBO(79, 88, 170, 1),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    height: widget.mediaQuery.height.h * 0.22,
                    padding: EdgeInsets.all(15.r),
                    margin: EdgeInsets.only(
                      top: 15.h,
                      right: 15.w,
                      left: 15.w,
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          widget.descriptiveText!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),

                if (widget.rightAnswer != null)
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
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
                      fontSize: widget.option != null ? 18.sp : 13.sp,
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
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15.h,
                    children: shuffledChoices.map(
                      (choiceChip) {
                        return ChoiceChip(
                          onSelected: (isSelected) {
                            return setState(() {
                              shuffledChoices =
                                  shuffledChoices.map((otherChip) {
                                final newChip =
                                    otherChip.copy(isSelected: false);
                                return choiceChip == newChip
                                    ? newChip.copy(isSelected: isSelected)
                                    : newChip;
                              }).toList();
                            });
                          },
                          shadowColor:
                              Theme.of(context).primaryColor.withOpacity(0.8),
                          pressElevation: 3,
                          label: Text(
                            choiceChip.choice,
                            maxLines: 3,
                          ),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 13.sp,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 7.h,
                          ),
                          backgroundColor: choiceChip.color,
                          selectedColor: Theme.of(context).primaryColor,
                          selected: choiceChip.isSelected,
                        );
                      },
                    ).toList(),
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
                        onPressed: () {
                          try {
                            final selectedChoice = shuffledChoices.firstWhere(
                              (choice) => choice.isSelected == true,
                            );
                            if (selectedChoice.isRightChoice) {
                              quizController.correctAnswer.value++;
                              // second quiz
                              final tempBlockScores = DataSharedPreferences
                                  .getSecondQuizCompletion();
                              debugPrint(
                                  'block score 2' + tempBlockScores.toString());
                              if (tempBlockScores[widget.index] == 0) {
                                tempBlockScores[widget.index] = 20;
                                DataSharedPreferences.setSecondQuizCompletion(
                                    tempBlockScores);
                                debugPrint('block score 2' +
                                    tempBlockScores.toString());
                              }
                            } else {
                              quizController.wrongAnswer.value++;
                            }
                            quizController.nextQuestion();
                          } catch (e) {
                            debugPrint(e.toString());
                            Fluttertoast.showToast(msg: 'Select one answer');
                          }
                        }),
                  ),
                SizedBox(
                  height: 15.h,
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
