import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showcaseview/showcaseview.dart';

import './interface/bottom_bar.dart';
import './interface/screens/onboarding/onboarding_screen.dart';
import './services/shared_preferences.dart';
import './services/my_cache_manager.dart';
import './services/time_session.dart';
import './services/audio_player_controller.dart';
// import './services/unity_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await DataSharedPreferences.init();
  await _localPath().then((dirApp) async {
    await compute(writeMusicinLocal, dirApp);
  });

  runApp(const MyApp());
}

Future<String> _localPath() async {
  String? musicLocalPath;
  final localDirectory = Directory.systemTemp.path;
  final musicDirectory = Directory('$localDirectory/music');
  if (await musicDirectory.exists()) {
    musicLocalPath = musicDirectory.path;
  } else {
    musicDirectory.create(recursive: true);
    musicLocalPath = musicDirectory.path;
  }

  return musicLocalPath;
}

void writeMusicinLocal(String dirApp) async {
  const url =
      'https://drive.google.com/uc?id=1tZbpXNFuFkQzqy4v3UhwiObAYjeZhLqq';

  debugPrint('directory:' + dirApp);
  String fileName = 'good_morning.mp3';
  File file = File(dirApp + fileName);
  HttpClient httpClient = HttpClient();

  try {
    if (!(await file.exists())) {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();

      if (response.statusCode == 200) {
        Uint8List bytes = await consolidateHttpClientResponseBytes(response);
        await file.writeAsBytes(bytes);
        debugPrint('writing success');
      } else {
        debugPrint('error in http client:' + response.statusCode.toString());
      }
    }
  } catch (e) {
    debugPrint('error when writing file:' + e.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Get.put(AudioPlayerController());
    Get.put(MyCacheManager());
    Get.put(TimeSession());
    // Get.put(UnityController());

    return ScreenUtilInit(
        designSize: const Size(360, 700),
        builder: () {
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
        });
  }
}

Widget homeController() {
  Widget? home;
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
  } else {
    home = const OnBoardingScreen();
  }
  return home;
}
