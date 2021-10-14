import 'package:mary/model/quiz_item.dart';

import '../model/quiz.dart';

final FirstQuiz firstQuiz = FirstQuiz(
  imageUrl: 'https://drive.google.com/uc?id=1BCjZ57grYVjc2-IoshXqlg_w6zr82Gf9',
  isOpen: true,
  quizItemData: [
    FirstQuizItem(
      quizQuestion: 'Fire engine',
      rightAnswer: 'fire engine',
      svgUrl: 'assets/images/fire engine.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Atv',
      rightAnswer: 'atv',
      svgUrl: 'assets/images/atv.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Ambulance',
      rightAnswer: 'ambulance',
      svgUrl: 'assets/images/ambulance.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Taxi',
      rightAnswer: 'taxi',
      svgUrl: 'assets/images/taxi.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Digger',
      rightAnswer: 'digger',
      svgUrl: 'assets/images/digger.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Bulldozer',
      rightAnswer: 'bulldozer',
      svgUrl: 'assets/images/bulldozer.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Sport car',
      rightAnswer: 'sport car',
      svgUrl: 'assets/images/sport car.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Crane',
      rightAnswer: 'crane',
      svgUrl: 'assets/images/crane.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Police car',
      rightAnswer: 'police car',
      svgUrl: 'assets/images/police car.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Tractor',
      rightAnswer: 'tractor',
      svgUrl: 'assets/images/tractor.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Garbage truck',
      rightAnswer: 'garbage truck',
      svgUrl: 'assets/images/garbage truck.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Train',
      rightAnswer: 'train',
      svgUrl: 'assets/images/train.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Scooter',
      rightAnswer: 'scooter',
      svgUrl: 'assets/images/scooter.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Camper',
      rightAnswer: 'camper',
      svgUrl: 'assets/images/camper.svg',
    ),
    FirstQuizItem(
      quizQuestion: 'Bicycle',
      rightAnswer: 'bicycle',
      svgUrl: 'assets/images/bicycle.svg',
    ),
  ],
  title: "Vocabullary",
);

SecondQuiz secondQuiz = SecondQuiz(
  imageUrl: 'https://drive.google.com/uc?id=1BCjZ57grYVjc2-IoshXqlg_w6zr82Gf9',
  isOpen: false,
  quizItemData: [],
  title: 'Area & Volume',
);
