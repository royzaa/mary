import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../play screen/widget/pop_up_volume.dart';
import '../../../services/time_session.dart';
import '../../../services/shared_preferences.dart';
import '../synopsis_screen/widgets/start_learning_button.dart';
import '../../../data/developer_data.dart';
import './widgets/developer_team_icon.dart';
import './widgets/reference_modal_bottom.dart';
import './widgets/attribution.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TimeSession timeSession = Get.find<TimeSession>();
    final String userName = DataSharedPreferences.getTitle();

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
                  height: size.height * 0.55,
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
                        left: 20,
                        top: MediaQuery.of(context).padding.top + 16 + 30 + 15,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: size.height * 0.4,
                            maxWidth: size.width,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraint) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: constraint.maxHeight * 0.1,
                                  child: const FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Thanks for hard work',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: constraint.maxHeight * 0.15,
                                  child: const FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Your contributions give significant\nother in this project',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                LottieBuilder.network(
                                  'https://assets3.lottiefiles.com/packages/lf20_sk5h1kfn.json',
                                  animate: true,
                                  height: constraint.maxHeight * 0.65,
                                  width: size.width * 0.3,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                  frameBuilder:
                                      (context, child, lottieCompotition) {
                                    if (!(lottieCompotition == null)) {
                                      return child;
                                    }
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // start learning button

                      const Positioned(
                        bottom: -25,
                        left: 20,
                        child: StartLearningButton(),
                      ),
                      // modal bottom button

                      Positioned(
                        bottom: -25,
                        right: 40,
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
                            child: const Icon(
                              Icons.book,
                              color: Color.fromRGBO(
                                255,
                                135,
                                127,
                                1,
                              ),
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    'Our team',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // developer icon

                SizedBox(
                  width: size.width,
                  height: 80,
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
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Attribution',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Attribution(
                  brandName: 'Royalty Free Music from Bensound',
                  logoUrl:
                      'https://drive.google.com/uc?id=1zJRJ1iK5xDTeFgojbzsBe1Gz0wc0ifjM',
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),

        // white containter as appbar to overlap lottie
        Container(
          color: Colors.white,
          width: size.width,
          height: MediaQuery.of(context).padding.top + 16 + 30 + 5,
        ),

        // greatings + name in appbar
        Positioned(
          left: 56,
          top: MediaQuery.of(context).padding.top + 12,
          child: Text(
            '${timeSession.getTimeSession()}, $userName',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        // app bar icon

        Positioned(
          top: MediaQuery.of(context).padding.top,
          child: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.filter_list,
              size: 32,
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
