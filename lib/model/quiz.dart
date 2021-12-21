import './quiz_item.dart';

abstract class Quiz {
  final String? title;
  final String? imageUrl;
  final int? quizNum;
  bool isOpen;

  Quiz({
    required this.imageUrl,
    required this.quizNum,
    required this.title,
    required this.isOpen,
  });
}

class FirstQuiz extends Quiz {
  final List<FirstQuizItem> quizItemData;
  FirstQuiz({
    String? title,
    String? imageUrl,
    required bool isOpen,
    required this.quizItemData,
  }) : super(
          isOpen: isOpen,
          imageUrl: imageUrl,
          quizNum: 1,
          title: title,
        );
}

class SecondQuiz extends Quiz {
  final List<SecondQuizItem> quizItemData;
  SecondQuiz({
    String? title,
    String? imageUrl,
    required bool isOpen,
    required this.quizItemData,
  }) : super(
          isOpen: isOpen,
          imageUrl: imageUrl,
          quizNum: 2,
          title: title,
        );
}

class ThirdAndFourthQuiz extends Quiz {
  final List<ThirdAndFourthQuizItem> quizItemData;
  ThirdAndFourthQuiz({
    required String title,
    String? imageUrl,
    required bool isOpen,
    required int quizNum,
    required this.quizItemData,
  }) : super(
          imageUrl: imageUrl,
          isOpen: isOpen,
          quizNum: quizNum,
          title: title,
        );
}
