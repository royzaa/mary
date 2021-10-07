import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/volume_controller.dart';
import '../../../../services/time_session.dart';
import '../../../../services/audio_player_controller.dart';

class PopUpVolume extends StatelessWidget {
  const PopUpVolume({
    Key? key,
    this.isInCreditScreen = false,
    this.iconColor = Colors.white,
  }) : super(key: key);
  final bool isInCreditScreen;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final soundController = Get.put(SoundController());
    final TimeSession timeSession = Get.find<TimeSession>();
    final AudioPlayerController audioPlayerController =
        Get.find<AudioPlayerController>();

    RxDouble val = soundController.volume;
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      icon: Icon(Icons.tune_outlined,
          color: isInCreditScreen
              ? Colors.black
              : timeSession.isDay
                  ? Colors.black
                  : iconColor),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: SizedBox(
            width: 230.w,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.volume_down_outlined,
                    size: 24.r,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Flexible(
                  child: SizedBox(
                    width: 200.w,
                    child: Obx(
                      () => Slider(
                        activeColor: Theme.of(context).primaryColor,
                        inactiveColor: Colors.indigo[200],
                        thumbColor: const Color.fromRGBO(67, 86, 255, 1.0),
                        max: 1,
                        min: 0,
                        value: val.value,
                        onChanged: (value) {
                          soundController.volumeController.setVolume(value);
                          debugPrint('value: ${val.value}');
                          if (value == 0) {
                            audioPlayerController.pause();
                          } else {
                            audioPlayerController.resume();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
