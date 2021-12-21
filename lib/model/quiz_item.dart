import './choice_chip.dart';

abstract class QuizItem {
  final String quizQuestion;
  const QuizItem({
    required this.quizQuestion,
  });
}

class FirstQuizItem extends QuizItem {
  final String rightAnswer;
  final String svgUrl;
  const FirstQuizItem({
    required String quizQuestion,
    required this.rightAnswer,
    required this.svgUrl,
  }) : super(
          quizQuestion: quizQuestion,
        );
}

class SecondQuizItem extends QuizItem {
  final String descriptiveText;
  final List<ChoiceChip> choices;
  const SecondQuizItem({
    required String quizQuestion,
    required this.choices,
    required this.descriptiveText,
  }) : super(
          quizQuestion: quizQuestion,
        );
}

class ThirdAndFourthQuizItem extends QuizItem {
  final String? naration;
  final String? correctAnswerForEssay;
  final String? questionImage;
  final bool isEssay;
  final List<ChoiceChip>? choices;
  const ThirdAndFourthQuizItem({
    required String quizQuestion,
    required this.isEssay,
    this.questionImage,
    this.choices,
    this.correctAnswerForEssay,
    this.naration,
  }) : super(quizQuestion: quizQuestion);
}
