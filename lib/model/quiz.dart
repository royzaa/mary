abstract class Quiz {
  final String? title;
  final String? imageUrl;
  final int? quizNum;
  bool? isOpen;

  Quiz(
      {required this.imageUrl,
      required this.quizNum,
      required this.title,
      this.isOpen});
}

class FirstQuiz extends Quiz {
  final List<String>? qustions;
  final List<String>? rightAnswers;
  FirstQuiz(
      {String? title,
      String? imageUrl,
      bool? isOpen,
      this.qustions,
      this.rightAnswers})
      : super(
          isOpen: isOpen,
          imageUrl: imageUrl,
          quizNum: 1,
          title: title,
        );
}

class SecondQuiz extends Quiz {
  final List<Map<String, dynamic>>? quizData;
  SecondQuiz({
    String? title,
    String? imageUrl,
    bool? isOpen,
    this.quizData,
  }) : super(
          isOpen: isOpen,
          imageUrl: imageUrl,
          quizNum: 2,
          title: title,
        );
}
