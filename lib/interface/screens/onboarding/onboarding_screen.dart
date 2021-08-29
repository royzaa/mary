import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';

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
      body: SingleChildScrollView(
        child: SizedBox(
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        index < onBoadringData.length - 1
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: const BorderSide(
                                            color: Colors.white),
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
                                    child: const Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SvgPicture.network(
                            onBoadringData[index].imageUrl,
                            width: size.width - 40,
                            placeholderBuilder: (context) => const Center(
                              child: PlaceholderLines(
                                count: 3,
                                animate: true,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          index == 0
                              ? onBoadringData[index]
                                  .title
                                  .replaceAll('!', name)
                              : onBoadringData[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          index == 0
                              ? onBoadringData[index].desc.replaceAll('!', name)
                              : onBoadringData[index].desc,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 15),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              BottomNavBar.routeName);
                                    },
                                    child: Text(
                                      'Get Started',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: size.height * 0.12,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                left: 20,
                width: size.width,
                height: 16,
                bottom: size.height * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: onBoadringData.length,
                  itemBuilder: (context, index) => AnimatedContainer(
                    width: index == pageIndicator ? 40 : 16,
                    height: 8,
                    curve: Curves.easeInBack,
                    margin: const EdgeInsets.only(
                      left: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: index == pageIndicator
                          ? BorderRadius.circular(10)
                          : BorderRadius.circular(8),
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
      ),
    );
  }
}
