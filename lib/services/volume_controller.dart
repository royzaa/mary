import 'package:get/get.dart';
import 'package:volume_controller/volume_controller.dart';

class SoundController extends GetxController {
  final VolumeController _volumeController = VolumeController();

  RxDouble getVolume = 0.0.obs;

  RxDouble get volume => getVolume;

  VolumeController get volumeController => _volumeController;

  @override
  void onInit() {
    _volumeController.listener((volume) {
      getVolume.value = volume;
    });
    super.onInit();
  }

  @override
  void dispose() {
    _volumeController.removeListener();
    super.dispose();
  }
}
