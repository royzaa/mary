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

ThirdAndFourthQuiz thirdQuiz = ThirdAndFourthQuiz(
  title: 'Areas & Volume',
  isOpen: DataSharedPreferences.getQuizThreeUnlocked(),
  quizNum: 3,
  imageUrl: 'https://drive.google.com/uc?id=1gQhvGWIMPTAXVbyx_gHcL-x_2tAd0Z2d',
  quizItemData: [
    const ThirdAndFourthQuizItem(
      quizQuestion:
          'A block is 30 cm long, 14 cm wide and 12 cm high. The volume of the block is… cm3',
      isEssay: true,
      correctAnswerForEssay: '5047',
    ),
    const ThirdAndFourthQuizItem(
      quizQuestion:
          'The volume of a block is 3600cm3. If the length and height of the block are 30 cm and 12 cm, respectively, then the width is … cm',
      isEssay: true,
      correctAnswerForEssay: '10',
    ),
    const ThirdAndFourthQuizItem(
      quizQuestion:
          'A cylinder without a lid has a blanket area of 880 cm². If the height of the cylinder is 10 cm, then the surface area of the cylinder is .... cm²',
      isEssay: true,
      correctAnswerForEssay: '1496',
    ),
    const ThirdAndFourthQuizItem(
      naration:
          'Budi makes a triangular prism-shaped lantern with a frame made of bamboo. The base is an equilateral triangle with a side length of 25 cm, and the height of the prism is 30 cm.',
      quizQuestion:
          'How many length of the bamboo used for the lantern frame in cm?',
      isEssay: true,
      correctAnswerForEssay: '165',
    ),
    ThirdAndFourthQuizItem(
      naration:
          'The bath tub at Arman\'s house is in the form of a block with a depth of 90cm, length of side 160cm and width of 80cm. The tub is 2/3 full and Arman wants to fill the tub.',
      quizQuestion: 'How many liters of water should Arman fill?',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: '384',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: '382',
        ),
        ChoiceChip(
          choice: '386',
        ),
        ChoiceChip(
          choice: '388',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      naration:
          'A block is made of a wire. The size of the framework of the beam is 8cm long and 7cm high. The surface area of the block is 292 cm.',
      quizQuestion: 'Calculate the width of the block!',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: '6',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: '12',
        ),
        ChoiceChip(
          choice: '3',
        ),
        ChoiceChip(
          choice: '18',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      naration:
          'An equilateral triangular pyramid has a base of 12 cm and a height of 8 cm. While the height of the upright side of the blanket triangle is 20 cm.',
      quizQuestion: 'Caculate the areas of the pyramid!',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: '408',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: '410',
        ),
        ChoiceChip(
          choice: '416',
        ),
        ChoiceChip(
          choice: '418',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      quizQuestion:
          'An object similar to a cone has a volume of 6.468 cm3. If the diameter is 42 cm, then the height of the cone is .... cm',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: '14',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: '12',
        ),
        ChoiceChip(
          choice: '15',
        ),
        ChoiceChip(
          choice: '16',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      naration:
          'Your sister is putting together a cake box in the shape of a cube. To make it look neat, she arranged the cake box into a larger cube. The side length of the cube that your sister made is equal 4 cake box.',
      quizQuestion:
          'How many cake boxes did your sister arrange to form a cube?',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: '64',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: '16',
        ),
        ChoiceChip(
          choice: '8',
        ),
        ChoiceChip(
          choice: '216',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      naration:
          'The base of a prism is a right triangle with a base length of 15 cm, a height of 8 cm, and a prism height of 21 cm.',
      quizQuestion: 'The area of the prism is .... cm²',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: '960',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: '958',
        ),
        ChoiceChip(
          choice: '940',
        ),
        ChoiceChip(
          choice: '920',
        ),
      ],
    ),
  ],
);

ThirdAndFourthQuiz fourthQuiz = ThirdAndFourthQuiz(
  title: 'Newton\'s Law',
  isOpen: DataSharedPreferences.getQuizFourthUnlocked(),
  quizNum: 4,
  imageUrl: 'https://drive.google.com/uc?id=1_AXikcWeHkVrTJq1IPRz6_KeJWyNpYUE',
  quizItemData: [
    const ThirdAndFourthQuizItem(
      questionImage:
          'https://4.bp.blogspot.com/-ERbvliHxcSk/WdXRaOrz9DI/AAAAAAAAD9I/XucB9DAs6ggAJyoOHVJxzYVUWJpxe4efwCLcBGAs/s1600/Gambar%2Bsoal%2B14%2B.JPG',
      quizQuestion:
          'The acceleration experienced by the object in the picture above is . . . . m/s^2',
      isEssay: true,
      correctAnswerForEssay: '1,2',
    ),
    const ThirdAndFourthQuizItem(
      quizQuestion:
          'The acceleration due to gravity on the moon is 1.6 m/s2 and the mass of an astronaut is 60 kg, so the weight of the astronaut is ... N',
      isEssay: true,
      correctAnswerForEssay: '96',
    ),
    ThirdAndFourthQuizItem(
      naration:
          'An airplane on earth weighs 1000 N with a gravity of 10 m/s2, it turns out that the plane was sent to the moon.',
      quizQuestion:
          'The weight of the plane on the moon with a gravity of 1.6 m/s2 is ....',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: '160 N',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: '106 N',
        ),
        ChoiceChip(
          choice: '1060 N',
        ),
        ChoiceChip(
          choice: '10 N',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      quizQuestion:
          'An object has a mass of 4 kg acting a force of 8 N, the acceleration experienced by the object is .... m/s2',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: '2',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: '16',
        ),
        ChoiceChip(
          choice: '0,2',
        ),
        ChoiceChip(
          choice: '1/2',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      quizQuestion:
          'Newton\'s laws of motion can explain all aspects of. . . . .',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: 'Motion of object',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Human life',
        ),
        ChoiceChip(
          choice: 'Plant life',
        ),
        ChoiceChip(
          choice: 'Hidrology',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      quizQuestion: 'An example of a non-touch force is...',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: 'Gravity',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Friction force',
        ),
        ChoiceChip(
          choice: 'Wardrobe push force',
        ),
        ChoiceChip(
          choice: 'Force when pull a table',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      quizQuestion:
          'When a force acts on objects the possible phenomena are, except...',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: 'An object is moving at a constant speed ',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'An object changes its direction of motion',
        ),
        ChoiceChip(
          choice: 'An object is moving and then it is at rest',
        ),
        ChoiceChip(
          choice: 'An object at rest then becomes in motion',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      quizQuestion:
          'The property of an object that resists change in motion is known as . . . . .',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: 'Inertia',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Force',
        ),
        ChoiceChip(
          choice: 'Friction',
        ),
        ChoiceChip(
          choice: 'Weight',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      quizQuestion: 'Newton\'s first law deals with . . . .',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: 'Inertia of objects',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Acceleration of object',
        ),
        ChoiceChip(
          choice: 'Action reaction force',
        ),
        ChoiceChip(
          choice: 'Circular motion',
        ),
      ],
    ),
    ThirdAndFourthQuizItem(
      quizQuestion:
          'Newton\'s second law states that force is equal to mass times with....',
      isEssay: false,
      choices: [
        ChoiceChip(
          choice: 'Acceleration',
          isRightChoice: true,
        ),
        ChoiceChip(
          choice: 'Velocity',
        ),
        ChoiceChip(
          choice: 'Time',
        ),
        ChoiceChip(
          choice: 'Weight',
        ),
      ],
    ),
  ],
);
