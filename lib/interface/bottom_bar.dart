import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './screens/credit_screen/credit_screen.dart';
import './screens/synopsis_screen/synopsis_screen.dart';
import './screens/play screen/play_screen.dart';
import './widget/label_menu.dart';
import './widget/my_show_case.dart';
import '../services/shared_preferences.dart';
import './widget/drawer.dart';
import '../services/audio_player_controller.dart';
import './widget/learning_goal.dart';
import './screens/learning_guide_screen/learning_guide_screen.dart';
// import '../services/unity_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  static const routeName = 'main-app';

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _one = GlobalKey();
  final _two = GlobalKey();
  final _three = GlobalKey();
  final _four = GlobalKey();
  final AudioPlayerController _audioPlayerController =
      Get.find<AudioPlayerController>();
  // final UnityController _unityController = Get.find<UnityController>();

  late List<Widget> _pages;

  int _selectedIndex = 1;

  void selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      const CreditScreen(),
      PlayScreen(
        thirdShowCaseKey: _three,
        fourthShowCaseKey: _four,
        secondShowCaseKey: _two,
      ),
      const SynopsisScreen(),
    ];
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!DataSharedPreferences.getFinishShowCase()!) {
        ShowCaseWidget.of(context)!.startShowCase(
          [_one, _two, _three, _four],
        );
      }
    });
  }

  DateTime? lastPressed;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        const maxDuration = Duration(seconds: 2);
        final isWarning =
            lastPressed == null || now.difference(lastPressed!) > maxDuration;
        if (isWarning) {
          HapticFeedback.mediumImpact();
          lastPressed = DateTime.now();

          Fluttertoast.showToast(
              msg: 'Tap twice to close the app',
              fontSize: 18,
              toastLength: Toast.LENGTH_LONG);
          Timer(maxDuration, () => Fluttertoast.cancel());
          return false;
        } else {
          _audioPlayerController.dispose();

          SystemNavigator.pop();

          return true;
        }
      },
      child: Scaffold(
        drawer: const MyDrawer(),
        backgroundColor: Colors.white,
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          elevation: 40,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: selectedPage,
            iconSize: 28.r,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle:
                TextStyle(color: Colors.black, fontSize: 14.sp),
            selectedLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.source_outlined,
                  size: 24.r,
                ),
                label: 'Credit',
                tooltip: 'Sources and developer team',
              ),
              const BottomNavigationBarItem(
                icon: Icon(null),
                label: 'Play',
                tooltip: 'Play',
              ),
              BottomNavigationBarItem(
                icon: MyShowCase(
                  title: "Bottom tab bar",
                  desc: "Tap here to change tab",
                  showCaseKey: _one,
                  child: Icon(
                    Icons.menu_book_outlined,
                    size: 24.r,
                  ),
                ),
                label: 'Synopsis',
                tooltip: 'Synopsis',
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SpeedDial(
          animationSpeed: 225,
          curve: Curves.easeInCubic,
          spaceBetweenChildren: 10.h,
          icon: Icons.play_arrow_rounded,
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: IconThemeData(size: 32.r),
          activeIcon: Icons.close,
          useRotationAnimation: true,
          overlayOpacity: 0.7,
          onOpen: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
          children: [
            SpeedDialChild(
                labelWidget: const LabelMenu(
                  title: 'Learning Guide',
                ),
                elevation: 20,
                child: Icon(
                  Icons.ballot_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 24.r,
                ),
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LearningGuideScreen()));
                }),
            SpeedDialChild(
                labelWidget: const LabelMenu(
                  title: 'Goal',
                ),
                elevation: 20,
                child: Icon(
                  Icons.auto_awesome,
                  color: Theme.of(context).primaryColor,
                  size: 24.r,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      elevation: 40,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const LearningGoal());
                }),
            SpeedDialChild(
              elevation: 20,
              labelWidget: const LabelMenu(
                title: 'Augmented Reality',
              ),
              child: Icon(
                Icons.camera_alt,
                color: Theme.of(context).primaryColor,
                size: 24.r,
              ),
            ),
            SpeedDialChild(
              elevation: 20,
              labelWidget: const LabelMenu(
                title: 'Learning Enrichment',
              ),
              child: Icon(
                Icons.border_color_sharp,
                color: Theme.of(context).primaryColor,
                size: 24.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
