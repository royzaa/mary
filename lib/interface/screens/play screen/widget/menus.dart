import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widget/cached_svg.dart';

class Menus extends StatefulWidget {
  const Menus({
    Key? key,
  }) : super(key: key);

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  //  MyCacheManager? _myCacheManager;
  PageController? _pageController;
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  int _selectedMenu = 0;

  int indexMenuIcon = 0;

  bool _recentlyPressed = false;

  void programaticNavigateMenu() {
    _pageController?.animateToPage(_selectedMenu,
        duration: const Duration(microseconds: 250),
        curve: Curves.elasticInOut);
  }

  void autoMoveMenu() {
    Timer.periodic(const Duration(milliseconds: 6500), (timer) {
      if (!_recentlyPressed) {
        _selectedMenu < 3 ? _selectedMenu++ : _selectedMenu = 0;
        _pageController!.animateToPage(_selectedMenu,
            duration: const Duration(milliseconds: 2500),
            curve: Curves.easeInCubic);
      }
    });
  }

  void delayAfterClick() {
    Timer.periodic(const Duration(microseconds: 1000), (timer) {
      //  debugPrint('recentlypressed value: $_recentlyPressed');
      if (_recentlyPressed) {
        Future.delayed(const Duration(milliseconds: 4000), () {
          _recentlyPressed = false;
        });
      }
    });
  }

  List<IconData> iconMenus = [
    Icons.ballot_outlined,
    Icons.auto_awesome,
    Icons.camera_alt,
    Icons.border_color_sharp,
  ];

  List<String> menusTitle = const [
    'Learning Guide',
    'Goal',
    'Augmented Reality',
    'Learning Enrichment'
  ];

  List<String> menusDescription = const [
    'Get started to learn with our guide',
    'Know your learning goal for better learning',
    'Display city vechicle in real world',
    'Learn and practice more'
  ];

  List<String> imageUrl = const [
    'https://drive.google.com/uc?id=1rpqeO5WdnIPIQZ5-1N9D6O9oEelS8mq0',
    'https://drive.google.com/uc?id=1BCjZ57grYVjc2-IoshXqlg_w6zr82Gf9',
    'https://drive.google.com/uc?id=15B5_58TpJhR6RKuRMUvBRqrfx3Bswm80',
    'https://drive.google.com/uc?id=1bfqnxYFwjfJS-PtCCqeQfP_Ae3BOEeN4'
  ];
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    autoMoveMenu();
    delayAfterClick();

    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  final double _iconSize = 32;

  final Color _iconColor = Colors.brown.shade900;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 350,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SizedBox(
              width: 72,
              height: 320,
              child: ListView.separated(
                  controller: _scrollController1,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(
                      parent: ClampingScrollPhysics()),
                  itemBuilder: (context, indexMenuIcon) => GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              _selectedMenu = indexMenuIcon;
                              _pageController!.animateToPage(indexMenuIcon,
                                  duration: const Duration(milliseconds: 750),
                                  curve: Curves.easeInCubic);
                            },
                          );
                          _recentlyPressed = true;
                          HapticFeedback.lightImpact();
                        },
                        child: AnimatedContainer(
                          curve: Curves.elasticInOut,
                          padding: EdgeInsets.all(
                              indexMenuIcon == _selectedMenu ? 14.0 : 10.0),
                          duration: const Duration(milliseconds: 750),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(137, 137, 137, 0.25),
                                blurRadius: 50,
                                spreadRadius: 5,
                                offset: Offset(0, 20),
                              ),
                            ],
                          ),
                          child: Icon(
                            iconMenus[indexMenuIcon],
                            color: indexMenuIcon == _selectedMenu
                                ? Theme.of(context).primaryColor
                                : _iconColor,
                            size: _iconSize,
                          ),
                        ),
                      ),
                  separatorBuilder: (context, _) => const SizedBox(
                        height: 15,
                      ),
                  itemCount: 4),
            ),
          ),
          Flexible(
            flex: 2,
            child: SizedBox(
              height: 358,
              child: SingleChildScrollView(
                controller: _scrollController2,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(137, 137, 137, 0.25),
                              blurRadius: 50,
                              spreadRadius: 5,
                              offset: Offset(0, 20),
                            ),
                          ]),
                      height: 260,
                      width: size.width < 330 ? 200 : 250,
                      child: PageView.builder(
                        onPageChanged: (index) {
                          setState(() {
                            indexMenuIcon = index;
                          });
                        },
                        scrollDirection: Axis.vertical,
                        clipBehavior: Clip.antiAlias,
                        physics: const BouncingScrollPhysics(),
                        itemCount: menusTitle.length,
                        controller: _pageController,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    menusTitle[index],
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: size.width < 330 ? 16 : 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Flexible(
                                  child: Text(
                                    menusDescription[index],
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: size.width < 330 ? 13 : 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Flexible(
                                    flex: 2,
                                    child: CachedSvg(svgUrl: imageUrl[index])),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width < 330 ? 200 : 235, 68),
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.all(0),
                      ),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (contest) => ArScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            // color: Theme.of(context).primaryColor,
                            // borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 102, 255, 0.15),
                                  offset: Offset(0, 5),
                                  spreadRadius: 5,
                                  blurRadius: 20),
                            ]),
                        child: const Text(
                          'Select menu',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
