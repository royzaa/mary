import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './interface/screens/play screen/play_screen.dart';
import './interface/bottom_bar.dart';

void main() {
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
      home: const BottomNavBar(),
    );
  }
}
