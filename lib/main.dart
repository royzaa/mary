import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcaseview/showcaseview.dart';

import './interface/bottom_bar.dart';
import './interface/screens/onboarding/onboarding_screen.dart';
import './services/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Future.delayed(
    const Duration(milliseconds: 1500),
  );
  await DataSharedPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MARY',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(102, 117, 255, 1),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: homeController(),
      routes: {
        BottomNavBar.routeName: (context) => ShowCaseWidget(
              onFinish: () {
                DataSharedPreferences.setFinishShowCase(true);
              },
              builder: Builder(
                builder: (context) {
                  return const BottomNavBar();
                },
              ),
            )
      },
    );
  }
}

Widget homeController() {
  late Widget home;
  if (DataSharedPreferences.getTitle() == '') {
    home = const OnBoardingScreen();
  } else if (DataSharedPreferences.getFinishShowCase()!) {
    home = ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          return const BottomNavBar();
        },
      ),
    );
  }
  return home;
}
