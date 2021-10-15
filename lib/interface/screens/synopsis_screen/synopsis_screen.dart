import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../services/shared_preferences.dart';
import '../play screen/widget/pop_up_volume.dart';
import './widgets/synopsis_modall_bottom.dart';
import '../../../services/time_session.dart';
import './widgets/chat_bubble.dart';
import '../../widget/cached_network_lottie.dart';

class SynopsisScreen extends StatefulWidget {
  const SynopsisScreen({Key? key}) : super(key: key);

  @override
  State<SynopsisScreen> createState() => _SynopsisScreenState();
}

class _SynopsisScreenState extends State<SynopsisScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  AnimationController? _animationController_2;
  AnimationController? _bubbleController;
  Animation? _bubbleAnimation;

  final List<String> _lottieDayNight = [
    'https://assets1.lottiefiles.com/packages/lf20_boJRmE.json',
    'https://assets9.lottiefiles.com/packages/lf20_HlhzUG.json'
  ];

  final String _lottieGirl =
      'https://assets7.lottiefiles.com/private_files/lf30_e6aaw5jt.json';

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    );
    _animationController_2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    );
    _bubbleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _bubbleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _bubbleController!, curve: Curves.fastOutSlowIn),
    );

    messages = 'Hi, are you calling me?';

    _bubbleController!.forward();

    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController!.reset();
      }
    });

    _bubbleController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(
          Duration(
              milliseconds:
                  messages == 'Hi, are you calling me?' ? 2500 : 4000),
          () => _bubbleController!.reverse().then(
                (_) => _bubbleController!.reset(),
              ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _animationController_2!.dispose();
    _bubbleController!.dispose();
    super.dispose();
  }

  void forwardAnimation() {
    _animationController!.forward();
    setState(() {
      tapInScreen = true;
    });
    _bubbleController!.forward().then((_) => tapInScreen = false);
  }

  bool startScrolled = false;
  bool tapInScreen = false;
  String messages = '';
  String message() {
    if (startScrolled) {
      messages = 'Are you start reading? Good luck';
    } else if (tapInScreen) {
      messages = 'Read synospis carefully';
    }
    return messages;
  }

  @override
  Widget build(BuildContext context) {
    final String userName = DataSharedPreferences.getTitle();
    final TimeSession timeSession = Get.find<TimeSession>();

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          CachedNetworkLottie(
            lottieUrl:
                timeSession.isDay ? _lottieDayNight[0] : _lottieDayNight[1],
            height: size.height,
            width: size.width,
            controller: _animationController_2,
            onLoad: (_) {
              _animationController_2!.repeat();
            },
          ),
          // appbar

          Positioned(
            left: 56.w,
            top: MediaQuery.of(context).padding.top + 12.h,
            child: Text(
              '${timeSession.getTimeSession()}, $userName',
              style: TextStyle(
                color: timeSession.isDay ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: MediaQuery.of(context).padding.top,
            child: const PopUpVolume(),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            child: IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.filter_list,
                size: 32.r,
                color: timeSession.isDay ? Colors.black : Colors.white,
              ),
            ),
          ),

          Positioned(
            left: 20.w,
            top: MediaQuery.of(context).padding.top + 70.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Synopsis',
                  style: TextStyle(
                    color: timeSession.isDay ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28.sp,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: size.width * 0.45.w,
                  child: Text(
                    'Let\'s read this beautiful synopsis for understanding more about our topic',
                    style: TextStyle(
                      color: timeSession.isDay ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                    ),
                    maxLines: 5,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: -40.w,
            bottom: 235.h,
            child: Transform(
              transform: Matrix4.identity()..rotateY(math.pi),
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: forwardAnimation,
                    child: CachedNetworkLottie(
                      fit: BoxFit.scaleDown,
                      lottieUrl: _lottieGirl,
                      height: size.height.h * 0.38,
                      width: size.height.h * 0.38,
                      controller: _animationController,
                      onLoad: (compositions) {
                        _animationController!.forward();
                      },
                    ),
                  ),
                  Positioned(
                    top: -20.h,
                    right: -20.w,
                    child: AnimatedBuilder(
                      animation: _bubbleAnimation!,
                      builder: (context, _) => Transform(
                        transform: Matrix4.identity()..rotateY(math.pi),
                        alignment: Alignment.center,
                        child: Transform.translate(
                          offset: Offset(
                            0,
                            (-40.h * _bubbleAnimation!.value).toDouble(),
                          ),
                          child: Transform.scale(
                            scale: 0.35.r + (_bubbleAnimation!.value * 0.65.r),
                            child: Opacity(
                              opacity: _bubbleAnimation!.value,
                              child: ChatBubble(
                                message: message(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // bottom sheet synopsis

          Positioned(
            height: size.height,
            width: size.width,
            bottom: 0,
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _animationController!.forward();
                  setState(() {
                    startScrolled = true;
                  });
                  _bubbleController!.reset();
                  _bubbleController!
                      .forward()
                      .then((_) => startScrolled = false);
                }
                return true;
              },
              child: GestureDetector(
                onTap: forwardAnimation,
                child: const SynopsisModalBottom(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
