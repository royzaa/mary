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
  final List<ChoiceChip> choices;
  const SecondQuizItem({required String quizQuestion, required this.choices})
      : super(
          quizQuestion: quizQuestion,
        );
}
