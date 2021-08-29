import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/volume_controller.dart';

class PopUpVolume extends StatelessWidget {
  const PopUpVolume({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final soundController = Get.put(SoundController());

    RxDouble val = soundController.volume;
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      icon: const Icon(Icons.tune_outlined),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              width: 230,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_down_outlined),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: 200,
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
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
