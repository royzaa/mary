import '../model/onboarding.dart';

import '../services/shared_preferences.dart';

final String userName = DataSharedPreferences.getTitle() == ''
    ? '!'
    : DataSharedPreferences.getTitle();

final List<OnBoarding> onBoadringData = [
  OnBoarding(
      title: 'Welcome $userName',
      desc:
          """Hi $userName, I am Mary. Today we will go around in our city. We will spot any wonderful city vehicles. I am very looking forward to start a journey with you.
""",
      imageUrl:
          'https://drive.google.com/uc?id=1DyeB3wusaZZc3Iii5iEwWAkkqFnyrmoZ'),
  const OnBoarding(
      title: 'Wonderful City Vehicles',
      desc:
          """Many vehicles pass through the city. We will recognize them one by one. Together with Mary, we will learn to describe them. Don't worry, this will be a lot of fun.
""",
      imageUrl:
          'https://drive.google.com/uc?id=1k3t47zL5Gnq1VGl9rZHppVhree0AIRiE'),
];
