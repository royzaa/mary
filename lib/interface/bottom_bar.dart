import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:showcaseview/showcaseview.dart';

import './screens/credit_screen.dart';
import './screens/synopsis_screen.dart';
import './screens/play screen/play_screen.dart';
import './widget/label_menu.dart';
import './widget/drawer.dart';
import './widget/my_show_case.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _one = GlobalKey();
  final _two = GlobalKey();
  final _three = GlobalKey();
  final _four = GlobalKey();

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
        secondShowCaseKey: _two,
        thirdShowCaseKey: _three,
        fourthShowCaseKey: _four,
      ),
      const SynopsisScreen()
    ];
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ShowCaseWidget.of(context)!.startShowCase([_one, _two, _three, _four]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 40,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: selectedPage,
          iconSize: 28,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle:
              const TextStyle(color: Colors.black, fontSize: 14),
          selectedLabelStyle: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.source_outlined,
              ),
              label: 'Credit',
              tooltip: 'Sources and developer team',
            ),
            BottomNavigationBarItem(
              icon: Icon(null),
              label: 'Play',
              tooltip: 'Play',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_outlined,
              ),
              label: 'Synopsis',
              tooltip: 'Synopsis',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MyShowCase(
        title: "Bottom tab bar",
        desc: "Tap here to change tab",
        showCaseKey: _one,
        child: SpeedDial(
          animationSpeed: 225,
          curve: Curves.easeInCubic,
          spaceBetweenChildren: 10,
          icon: Icons.play_arrow_rounded,
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(size: 32),
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
              ),
            ),
            SpeedDialChild(
              labelWidget: const LabelMenu(
                title: 'Goal',
              ),
              elevation: 20,
              child: Icon(
                Icons.auto_awesome,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SpeedDialChild(
              elevation: 20,
              labelWidget: const LabelMenu(
                title: 'Augmented Reality',
              ),
              child: Icon(
                Icons.camera_alt,
                color: Theme.of(context).primaryColor,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}