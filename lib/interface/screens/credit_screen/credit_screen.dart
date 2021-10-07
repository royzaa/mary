import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../play screen/widget/pop_up_volume.dart';
import '../../../services/time_session.dart';
import '../../../services/shared_preferences.dart';
import '../synopsis_screen/widgets/start_learning_button.dart';
import '../../../data/developer_data.dart';
import './widgets/developer_team_icon.dart';
import './widgets/reference_modal_bottom.dart';
import './widgets/attribution.dart';
import '../../widget/cached_network_lottie.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TimeSession timeSession = Get.find<TimeSession>();
    final String userName = DataSharedPreferences.getTitle();

    const String lottieUrl =
        'https://assets3.lottiefiles.com/packages/lf20_sk5h1kfn.json';

    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.none,
                  height: size.height * 0.55.h,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 102, 255, 0.15),
                        offset: Offset(0, 5),
                        spreadRadius: 5,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // container: lottie, title, and subtitle

                      Positioned(
                        left: 20.w,
                        top: MediaQuery.of(context).padding.top +
                            16.h +
                            30.h +
                            15.h,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: size.height * 0.4.h,
                            maxWidth: size.width,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraint) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: constraint.maxHeight * 0.1,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Thanks for hard work',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: constraint.maxHeight * 0.15,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Your contributions give significant\nother in this project',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                CachedNetworkLottie(
                                    lottieUrl: lottieUrl,
                                    height: constraint.maxHeight * 0.65,
                                    width: size.width * 0.3.w),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // start learning button

                      Positioned(
                        bottom: -25.h,
                        left: 20.w,
                        child: const StartLearningButton(),
                      ),
                      // modal bottom button

                      Positioned(
                        bottom: -25.h,
                        right: 40.w,
                        child: GestureDetector(
                          onTap: () {
                            HapticFeedback.mediumImpact();
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const ReferencModalBottom(),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                        255,
                                        135,
                                        127,
                                        0.25,
                                      ),
                                      blurRadius: 20,
                                      spreadRadius: 3,
                                      offset: Offset(0, 5)),
                                ]),
                            child: Icon(
                              Icons.book,
                              color: const Color.fromRGBO(
                                255,
                                135,
                                127,
                                1,
                              ),
                              size: 36.r,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 40.h),
                  child: Text(
                    'Our team',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                // developer icon

                SizedBox(
                  width: size.width,
                  height: 80.h,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => DeveloperTeamIcon(
                      index: index,
                      name: devData[index].name,
                      imageUrl: devData[index].imageUrl,
                      roles: devData[index].roles,
                      sosmed: devData[index].sosmed,
                      sosmedUrl: devData[index].sosmedurl,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Attribution',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Attribution(
                  brandName: 'Royalty Free Music from Bensound',
                  logoUrl:
                      'https://drive.google.com/uc?id=1zJRJ1iK5xDTeFgojbzsBe1Gz0wc0ifjM',
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Attribution(
                  brandName: 'Pray illustration by Storyset',
                  logoUrl:
                      'https://drive.google.com/uc?id=1WLyBmvjCFZVlbVpzZV7x4nYtysJk0QwC',
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),

        // white containter as appbar to overlap lottie
        Container(
          color: Colors.white,
          width: size.width,
          height: MediaQuery.of(context).padding.top + 16.h + 30.h + 5.h,
        ),

        // greatings + name in appbar
        Positioned(
          left: 56.w,
          top: MediaQuery.of(context).padding.top + 12.h,
          child: Text(
            '${timeSession.getTimeSession()}, $userName',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
        ),
        // app bar icon

        Positioned(
          top: MediaQuery.of(context).padding.top,
          child: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.filter_list,
              size: 32.r,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: MediaQuery.of(context).padding.top,
          child: const PopUpVolume(
            isInCreditScreen: true,
          ),
        ),
      ],
    );
  }
}
