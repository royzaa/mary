import 'package:get/get.dart';

class TimeSession extends GetxController {
  String getTimeSession() {
    String session = '';

    int hour = DateTime.now().hour;

    if (hour > 4 && hour < 12) {
      session = 'Good Morning';
    } else if (hour >= 12 && hour < 15) {
      session = 'Good Afternoon';
    } else if (hour >= 15 && hour <= 19) {
      session = 'Good Evening';
    } else {
      session = 'Good Night';
    }
    return session;
  }

  late bool _isDay;

  bool get isDay => _isDay;

  @override
  void onInit() {
    _isDay = getTimeSession() == 'Good Morning' ||
        getTimeSession() == 'Good Afternoon';
    super.onInit();
  }
}
