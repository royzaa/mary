import 'package:mary/model/choice_chip.dart';
import 'package:mary/model/quiz_item.dart';

import '../model/quiz.dart';
import '../services/shared_preferences.dart';

final FirstQuiz firstQuiz = FirstQuiz(
  imageUrl: 'https://drive.google.com/uc?id=1SUulJINm-ty0KfqJd8zo_aTHhqM59N1A',
  isOpen: true,
  quizItemData: [
    const FirstQuizItem(
      quizQuestion: 'Fire engine',
      rightAnswer: 'fire engine',
      svgUrl: 'assets/images/fire engine.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Atv',
      rightAnswer: 'atv',
      svgUrl: 'assets/images/atv.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Ambulance',
      rightAnswer: 'ambulance',
      svgUrl: 'assets/images/ambulance.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Taxi',
      rightAnswer: 'taxi',
      svgUrl: 'assets/images/taxi.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Excavator',
      rightAnswer: 'excavator',
      svgUrl: 'assets/images/digger.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Bulldozer',
      rightAnswer: 'bulldozer',
      svgUrl: 'assets/images/bulldozer.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Sport car',
      rightAnswer: 'sport car',
      svgUrl: 'assets/images/sport car.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Derrick',
      rightAnswer: 'derrick',
      svgUrl: 'assets/images/crane.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Police car',
      rightAnswer: 'police car',
      svgUrl: 'assets/images/police car.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Tractor',
      rightAnswer: 'tractor',
      svgUrl: 'assets/images/tractor.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Garbage truck',
      rightAnswer: 'garbage truck',
      svgUrl: 'assets/images/garbage truck.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Train',
      rightAnswer: 'train',
      svgUrl: 'assets/images/train.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Scooter',
      rightAnswer: 'scooter',
      svgUrl: 'assets/images/scooter.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Camper',
      rightAnswer: 'camper',
      svgUrl: 'assets/images/camper.svg',
    ),
    const FirstQuizItem(
      quizQuestion: 'Bicycle',
      rightAnswer: 'bicycle',
      svgUrl: 'assets/images/bicycle.svg',
    ),
  ],
  title: "Vocabullary",
);

SecondQuiz secondQuiz = SecondQuiz(
  imageUrl: 'https://drive.google.com/uc?id=1mZmhgZWfj4PJlCvilV6CspXpeNDOgFgm',
  isOpen: DataSharedPreferences.getQuizTwoUnlocked()!,
  quizItemData: [
    SecondQuizItem(
      quizQuestion: 'What does the text tell about?',
      choices: [
        ChoiceChip(
          choice: 'Rose species',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Gardening',
        ),
        ChoiceChip(
          choice: 'Flowers',
        ),
        ChoiceChip(
          choice: 'How to grow rose plant',
        ),
      ],
      descriptiveText:
          'Rose is plant with enchanting flowers from genus Rosa which has more than 100 species. This woody perennial plant grows in groups, allowing them to form climbing shrubs with prickles. Rose has various flowers in shape and sizes, making it one among popular flowering plants found in a house. Most rose species are native to Asia, but some others are native to North America and Europe. It is typically grown for beauty and fragrant. Some species are used for commercial perfumery while some others are cut for ornamental flowers. In addition, rose also has minor medicinal uses.',
    ),
    SecondQuizItem(
      quizQuestion: 'This statement is correct, except...',
      choices: [
        ChoiceChip(
          choice: 'Rose only has one variant of shape and size',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Rose has more than 100 species',
        ),
        ChoiceChip(
          choice: 'Rose is native to Asia',
        ),
        ChoiceChip(
          choice: 'Rose can be used for ornamental plant',
        ),
      ],
      descriptiveText:
          'Rose is plant with enchanting flowers from genus Rosa which has more than 100 species. This woody perennial plant grows in groups, allowing them to form climbing shrubs with prickles. Rose has various flowers in shape and sizes, making it one among popular flowering plants found in a house. Most rose species are native to Asia, but some others are native to North America and Europe. It is typically grown for beauty and fragrant. Some species are used for commercial perfumery while some others are cut for ornamental flowers. In addition, rose also has minor medicinal uses.',
    ),
    SecondQuizItem(
      quizQuestion: 'It is typically grown … . The word “it” refers to …',
      choices: [
        ChoiceChip(
          choice: 'Rose species',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Asia',
        ),
        ChoiceChip(
          choice: 'Beauty',
        ),
        ChoiceChip(
          choice: 'Commercial perfumery',
        ),
      ],
      descriptiveText:
          'Rose is plant with enchanting flowers from genus Rosa which has more than 100 species. This woody perennial plant grows in groups, allowing them to form climbing shrubs with prickles. Rose has various flowers in shape and sizes, making it one among popular flowering plants found in a house. Most rose species are native to Asia, but some others are native to North America and Europe. It is typically grown for beauty and fragrant. Some species are used for commercial perfumery while some others are cut for ornamental flowers. In addition, rose also has minor medicinal uses.',
    ),
    SecondQuizItem(
      quizQuestion: 'Based on the text, which statement is true?',
      choices: [
        ChoiceChip(
          choice: 'Rose has minor benefit for medicinal uses',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'People grow rose only for beauty',
        ),
        ChoiceChip(
          choice: 'Rose is not a popular flowering plant',
        ),
        ChoiceChip(
          choice: 'North America is not a native to rose species',
        ),
      ],
      descriptiveText:
          'Rose is plant with enchanting flowers from genus Rosa which has more than 100 species. This woody perennial plant grows in groups, allowing them to form climbing shrubs with prickles. Rose has various flowers in shape and sizes, making it one among popular flowering plants found in a house. Most rose species are native to Asia, but some others are native to North America and Europe. It is typically grown for beauty and fragrant. Some species are used for commercial perfumery while some others are cut for ornamental flowers. In addition, rose also has minor medicinal uses.',
    ),
    SecondQuizItem(
      quizQuestion:
          'What makes Indonesia one of most populous countries in the world?',
      choices: [
        ChoiceChip(
          choice: 'Indonesia has more than 261 million people',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'It is located in South East Asia',
        ),
        ChoiceChip(
          choice: 'Indonesia has more than 17,000 islands',
        ),
        ChoiceChip(
          choice: 'It has more ethnics and languages',
        ),
      ],
      descriptiveText:
          'Indonesia or commonly known as Republic of Indonesia is one of South East Asia countries. Located between Pacific and Indian Ocean, it makes Indonesia the world’s largest archipelago country. Also called as Nusantara, this country has more than 17,000 islands. Having more than 261 million people,  Indonesia becomes 4th most populous country in the world. Indonesia has more ethnics, languages and culture than other countries. Data showed that Indonesia has several ethnic groups including Javanese, Sundanese, and other with more than 700 recognized regional language.',
    ),
    SecondQuizItem(
      quizQuestion: 'What is the main idea of the paragraph?',
      choices: [
        ChoiceChip(
          choice: 'Indonesia is one of South East Asia countries',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Indonesia is 4th most populous country',
        ),
        ChoiceChip(
          choice: 'Ethnics and languages make Indonesia rich',
        ),
        ChoiceChip(
          choice:
              'Indonesia is an Asian country which has\n many cultures, ethnics, as well as people',
        ),
      ],
      descriptiveText:
          'Indonesia or commonly known as Republic of Indonesia is one of South East Asia countries. Located between Pacific and Indian Ocean, it makes Indonesia the world’s largest archipelago country. Also called as Nusantara, this country has more than 17,000 islands. Having more than 261 million people,  Indonesia becomes 4th most populous country in the world. Indonesia has more ethnics, languages and culture than other countries. Data showed that Indonesia has several ethnic groups including Javanese, Sundanese, and other with more than 700 recognized regional language.',
    ),
    SecondQuizItem(
      quizQuestion: 'What does the tense of the paragraph?',
      choices: [
        ChoiceChip(
          choice: 'Simple present tenses',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Simple continous tenses',
        ),
        ChoiceChip(
          choice: 'Perfect tenses',
        ),
        ChoiceChip(
          choice: 'Simple future tenses',
        ),
      ],
      descriptiveText:
          'Indonesia or commonly known as Republic of Indonesia is one of South East Asia countries. Located between Pacific and Indian Ocean, it makes Indonesia the world’s largest archipelago country. Also called as Nusantara, this country has more than 17,000 islands. Having more than 261 million people,  Indonesia becomes 4th most populous country in the world. Indonesia has more ethnics, languages and culture than other countries. Data showed that Indonesia has several ethnic groups including Javanese, Sundanese, and other with more than 700 recognized regional language.',
    ),
    SecondQuizItem(
      quizQuestion: 'What are generic structure of text above?',
      choices: [
        ChoiceChip(
          choice: 'Description',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Identification',
        ),
        ChoiceChip(
          choice: 'Orientation',
        ),
        ChoiceChip(
          choice: 'Explanation',
        ),
      ],
      descriptiveText:
          'My cat is a Persian cat with flat nose and fluffy hair. It has sharp, yellow eyes that glow in the dark. Shorty likes to run around the house, chasing any moving things. I like to see Shorty sleeping because it looks cute. Shorty does not like to eat canned food, instead it prefers fresh tuna.',
    ),
    SecondQuizItem(
      quizQuestion: 'Which breed is Shorty?',
      choices: [
        ChoiceChip(
          choice: 'Persian',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Angora',
        ),
        ChoiceChip(
          choice: 'Egypt',
        ),
        ChoiceChip(
          choice: 'Half-breed',
        ),
      ],
      descriptiveText:
          'I have a new cat, its name is Shorty. I call it Shorty because it is short than the other cats. My cat is a Persian cat with flat nose and fluffy hair. It has sharp, yellow eyes that glow in the dark. Shorty likes to run around the house, chasing any moving things. I like to see Shorty sleeping because it looks cute. Shorty does not like to eat canned food, instead it prefers fresh tuna.',
    ),
    SecondQuizItem(
      quizQuestion: 'What does the writer tell about?',
      choices: [
        ChoiceChip(
          choice: 'New cat named Shorty',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'New toy',
        ),
        ChoiceChip(
          choice: 'Family',
        ),
        ChoiceChip(
          choice: 'Writer\'s new hobby',
        ),
      ],
      descriptiveText:
          'I have a new cat, its name is Shorty. I call it Shorty because it is short than the other cats. My cat is a Persian cat with flat nose and fluffy hair. It has sharp, yellow eyes that glow in the dark. Shorty likes to run around the house, chasing any moving things. I like to see Shorty sleeping because it looks cute. Shorty does not like to eat canned food, instead it prefers fresh tuna.',
    ),
  ],
  title: 'Text and structure',
);
