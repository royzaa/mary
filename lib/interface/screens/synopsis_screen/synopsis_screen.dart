import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../services/shared_preferences.dart';
import '../play screen/widget/pop_up_volume.dart';
import './widgets/synopsis_modall_bottom.dart';
import '../../../services/time_session.dart';

class SynopsisScreen extends StatefulWidget {
  const SynopsisScreen({Key? key}) : super(key: key);

  @override
  State<SynopsisScreen> createState() => _SynopsisScreenState();
}

class _SynopsisScreenState extends State<SynopsisScreen> {
  final TimeSession _timeSession = Get.find<TimeSession>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // showModalBottomSheet(
      //   context: context,
      //   isScrollControlled: true,
      //   enableDrag: true,
      //   backgroundColor: Colors.transparent,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(60),
      //     ),
      //   ),
      //   clipBehavior: Clip.none,
      //   builder: (contex) => const SynopsisModalBottom(),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    final String userName = DataSharedPreferences.getTitle();

    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        LottieBuilder.network(
          _timeSession.isDay
              ? 'https://assets1.lottiefiles.com/packages/lf20_boJRmE.json'
              : 'https://assets9.lottiefiles.com/packages/lf20_HlhzUG.json',
          animate: true,
          fit: BoxFit.cover,
          height: size.height,
          frameBuilder: (context, child, composition) {
            if (!(composition == null)) {
              return child;
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        Positioned(
          right: -40,
          bottom: size.height * 0.35,
          child: Transform(
            transform: Matrix4.identity()..rotateY(math.pi),
            alignment: Alignment.center,
            child: Lottie.network(
              'https://assets7.lottiefiles.com/private_files/lf30_e6aaw5jt.json',
              animate: true,
              fit: BoxFit.cover,
              height: size.width * 0.6,
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: size.height * 0.225,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Synopsis',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: size.width * 0.38,
                child: const Text(
                  'Let\'s read this beautiful synopsis for understanding more about our topic',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  maxLines: 5,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 56,
          top: MediaQuery.of(context).padding.top + 16,
          child: Text(
            '${_timeSession.getTimeSession()}, $userName',
            style: TextStyle(
              color: _timeSession.isDay ? Colors.black : Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Positioned(
          height: size.height,
          width: size.width,
          bottom: 0,
          child: const SynopsisModalBottom(),
        ),
        Positioned(
          right: 0,
          top: MediaQuery.of(context).padding.top,
          child: const PopUpVolume(),
        ),
      ],
    );
  }
}
