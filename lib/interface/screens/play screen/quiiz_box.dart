import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (isOpen!) {
          Fluttertoast.showToast(
            msg: 'Quiz currently unavailable',
            gravity: ToastGravity.BOTTOM,
          );
        } else {
          HapticFeedback.mediumImpact();
          Fluttertoast.showToast(
            msg: 'Complete previous quiz, please',
            gravity: ToastGravity.BOTTOM,
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: size.width < 330 ? 90 : 120,
              width: size.width < 330 ? 110 : 140,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SvgPicture.network(imageUrl!,
                              width: size.width < 330 ? 80 : 110,
                              fit: BoxFit.cover,
                              placeholderBuilder: (context) => const Center(
                                    child: PlaceholderLines(
                                      count: 2,
                                    ),
                                  )),
                        ),
                        Text(
                          quizTitle!,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor.withRed(20),
                              fontSize: size.width < 330 ? 9 : 12),
                        )
                      ],
                    )
                  : Center(
                      child: Icon(
                        Icons.lock,
                        color: Colors.grey[400]!.withOpacity(0.7),
                        size: 36,
                      ),
                    )),
          const SizedBox(
            height: 8,
          ),
          Text('Quiz $numQuiz'),
        ],
      ),
    );
  }
}
