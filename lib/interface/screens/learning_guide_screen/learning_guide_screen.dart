import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/learning_guide_data.dart';
import './widgets/learning_guide_card.dart';
import './widgets/learning_guide_desc.dart';

class LearningGuideScreen extends StatefulWidget {
  const LearningGuideScreen({Key? key}) : super(key: key);

  @override
  _LearningGuideScreenState createState() => _LearningGuideScreenState();
}

class _LearningGuideScreenState extends State<LearningGuideScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
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
                height: MediaQuery.of(context).padding.top,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  borderRadius: BorderRadius.circular(25.r),
                  color: Theme.of(context).primaryColor,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
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
                width: 250.w,
                child: PageView.builder(
                  allowImplicitScrolling: true,
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
                    return LearningGuideCard(
                      num: index + 1,
                      svgUrl: learningGuides[index].svgUrl,
                      title: learningGuides[index].title,
                    );
                  },
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
