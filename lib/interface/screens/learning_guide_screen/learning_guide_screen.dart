import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/learning_guide_data.dart';
import './widgets/learning_guide_card.dart';
import './widgets/learning_guide_desc.dart';

import '../../../services/audio_player_controller.dart';

class LearningGuideScreen extends StatefulWidget {
  const LearningGuideScreen({Key? key}) : super(key: key);

  @override
  _LearningGuideScreenState createState() => _LearningGuideScreenState();
}

class _LearningGuideScreenState extends State<LearningGuideScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final audioPlayer = Get.find<AudioPlayerController>();

  int _currentIndex = 0;

  @override
  void initState() {
    audioPlayer.pause();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.resume();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back, size: 24.r),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Learning guide',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Text(
                              'Follow our guide, be agile!',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.assignment,
                      color: Colors.grey[700],
                      size: 24.r,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Theme.of(context).primaryColor,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 8.h,
                ),
                child: Text(
                  'Step ${_currentIndex + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                height: 320.h,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    _currentIndex != 0
                        ? Positioned(
                            left: 0.w,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 32.r,
                              color: Colors.grey[400],
                            ),
                          )
                        : const SizedBox(),
                    _currentIndex != 4
                        ? Positioned(
                            right: 0.w,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 32.r,
                              color: Colors.grey[400],
                            ),
                          )
                        : const SizedBox(),
                    PageView.builder(
                      clipBehavior: Clip.none,
                      allowImplicitScrolling: true,
                      controller: PageController(viewportFraction: 0.8),
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                          _pageController.animateToPage(_currentIndex,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeInSine);
                        });
                      },
                      itemCount: learningGuides.length,
                      itemBuilder: (context, index) {
                        return Transform.scale(
                          scale: index == _currentIndex ? 1 : 0.8,
                          child: LearningGuideCard(
                            num: index + 1,
                            svgUrl: learningGuides[index].svgUrl,
                            title: learningGuides[index].title,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  allowImplicitScrolling: false,
                  scrollDirection: Axis.vertical,
                  itemCount: learningGuides.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return LearningGuideDesc(
                        desc: learningGuides[index].descriptions);
                  },
                ),
              ),
              // SizedBox(
              //   height: 20.h,
              // ),
              SizedBox(
                height: 8.h,
                child: ListView.builder(
                  itemCount: learningGuides.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 8.r,
                      width: 8.r,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == _currentIndex
                            ? Theme.of(context).primaryColor
                            : Colors.grey[400],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
