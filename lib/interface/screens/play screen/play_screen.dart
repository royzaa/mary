import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './widget/pop_up_volume.dart';
import './widget/menus.dart';
import 'widget/quiiz_box.dart';
import '../../../data/quizes.dart';
import '../../widget/my_show_case.dart';
import '../../../services/shared_preferences.dart';
import '../../../services/time_session.dart';
import '../../widget/cached_image.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = '/player-screen';
  const PlayScreen(
      {Key? key,
      required this.secondShowCaseKey,
      required this.thirdShowCaseKey,
      required this.fourthShowCaseKey})
      : super(key: key);

  final GlobalKey thirdShowCaseKey;
  final GlobalKey secondShowCaseKey;
  final GlobalKey fourthShowCaseKey;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Color drawerColor = Colors.white;
  ScrollController? _scrollController;
  TimeSession? _timeSession;

  @override
  void initState() {
    _timeSession = Get.find<TimeSession>();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String _userName = DataSharedPreferences.getTitle();

    String getImageSession() {
      String imageUrl = '';

      int hour = DateTime.now().hour;

      if (hour > 3 && hour < 12) {
        imageUrl =
            'https://drive.google.com/uc?id=1cE48IYRJQvtPcsod-xcfuhIsw9ebzWTi';
      } else if (hour >= 12 && hour < 15) {
        imageUrl =
            'https://drive.google.com/uc?id=1yWcazbQVw1iIhPu5R0ouNONTEHf0vK5I';
      } else if (hour >= 15 && hour <= 19) {
        imageUrl =
            'https://drive.google.com/uc?id=13BsjrU03ErBDAcgmXbgXHHH2tKJBKMe8';
      } else {
        imageUrl =
            'https://drive.google.com/uc?id=1lRWBEEfnHPfeMejG-mD4NUYPmMOHIxfk';
      }

      return imageUrl;
    }

    return NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (_scrollController!.position.pixels > 120) {
            setState(() {
              drawerColor = Colors.black;
            });
          } else {
            setState(() {
              drawerColor = Colors.white;
            });
          }
          return true;
        },
        child: NestedScrollView(
          floatHeaderSlivers: true,
          controller: _scrollController!,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: MyShowCase(
                    showCaseKey: widget.secondShowCaseKey,
                    title: 'Drawer',
                    desc: 'Here you can find other specific menu',
                    child: Icon(
                      Icons.filter_list,
                      size: 32,
                      color: _timeSession!.isDay ? Colors.black : drawerColor,
                    ),
                  ),
                ),
                expandedHeight: 180.0,
                backgroundColor: Colors.white,

                actions: [
                  MyShowCase(
                    title: "Settings",
                    desc: "Tap here to adjust app setting",
                    showCaseKey: widget.thirdShowCaseKey,
                    child: PopUpVolume(
                      iconColor: drawerColor,
                    ),
                  ),
                ],
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0,
                pinned: true,
                //snap: true,
                floating: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    alignment: Alignment.bottomCenter,
                    fit: StackFit.expand,
                    children: [
                      CachedImage(
                        imageUrl: getImageSession(),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                      ),
                    ],
                  ),
                  titlePadding: const EdgeInsets.only(left: 54, bottom: 16),
                  title: Text(
                    '${_timeSession!.getTimeSession()}, ${_userName.split(' ')[0]}',
                    style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Select menu',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Find menu you want to explore',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[400]!.withOpacity(0.8)),
                  ),
                  SizedBox(
                    height: size.width < 330 ? 30 : 10,
                  ),
                  MyShowCase(
                    title: 'Menu',
                    desc: "You can select menu icon to start your learning",
                    showCaseKey: widget.fourthShowCaseKey,
                    child: const Menus(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Quizes',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      QuizBox(
                          isOpen: firstQuiz.isOpen,
                          numQuiz: firstQuiz.quizNum,
                          imageUrl: firstQuiz.imageUrl,
                          quizTitle: firstQuiz.title),
                      const SizedBox(
                        width: 25,
                      ),
                      QuizBox(
                        isOpen: secondQuiz.isOpen,
                        numQuiz: secondQuiz.quizNum,
                        imageUrl: secondQuiz.imageUrl,
                        quizTitle: secondQuiz.title,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
