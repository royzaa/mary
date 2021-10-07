import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/onboarding_data.dart';
import '../../bottom_bar.dart';
import './welcome_dialog.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int currentPage = 0;
  int pageIndicator = 0;

  @override
  void initState() {
    _pageController = PageController();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return const WelcomeDialog();
        },
      ).then((value) {
        name = value;
        setState(() {});
      });
    });
    super.initState();
  }

  String name = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: onBoadringData.length,
              onPageChanged: (index) {
                setState(() {
                  pageIndicator = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  width: size.width,
                  height: size.height,
                  color: Theme.of(context).primaryColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      index < onBoadringData.length - 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                      side:
                                          const BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      currentPage++;
                                    });
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 350),
                                        curve: Curves.easeInCirc);
                                  },
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.r),
                        child: SvgPicture.network(
                          onBoadringData[index].imageUrl,
                          width: size.width - 40.w,
                          placeholderBuilder: (context) => const Center(
                            child: PlaceholderLines(
                              count: 3,
                              animate: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        index == 0
                            ? onBoadringData[index].title.replaceAll('!', name)
                            : onBoadringData[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Flexible(
                        child: Text(
                          index == 0
                              ? onBoadringData[index].desc.replaceAll('!', name)
                              : onBoadringData[index].desc,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          index == onBoadringData.length - 1
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    primary: Colors.white,
                                    onPrimary: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 25.w, vertical: 15.h),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        BottomNavBar.routeName);
                                  },
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: size.height * 0.12.h,
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            Positioned(
              left: 20.w,
              width: size.width,
              height: 16.h,
              bottom: size.height * 0.1.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: onBoadringData.length,
                itemBuilder: (context, index) => AnimatedContainer(
                  width: index == pageIndicator ? 40.w : 16.w,
                  height: 8.h,
                  curve: Curves.easeInBack,
                  margin: EdgeInsets.only(
                    left: 4.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: index == pageIndicator
                        ? BorderRadius.circular(10.r)
                        : BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.white),
                    color: index == pageIndicator
                        ? Colors.white
                        : Colors.transparent,
                  ),
                  duration: const Duration(
                    milliseconds: 350,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
