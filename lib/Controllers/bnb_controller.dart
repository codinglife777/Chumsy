import 'package:chumsy_app/Controllers/map_screen_controllers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BNBController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxBool showEventGoingButton = false.obs;
  final MapScreenControllers mapScreenControllers =
      Get.put(MapScreenControllers());

  void changeIndex(int index) {
    currentIndex.value = index;
    if (kDebugMode) {
      print('Current Index is: ${currentIndex.value}');
    }
    mapScreenControllers.closeInfoWindow();
    update();
  }

  void changeEventGoinOnButton() {
    showEventGoingButton.value = !showEventGoingButton.value;
    update();
  }
}
