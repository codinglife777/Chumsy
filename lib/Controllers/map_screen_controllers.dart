import 'package:get/get.dart';

class MapScreenControllers extends GetxController {
  RxBool isInfoWindowOpen = false.obs;

  void toggleInfoWindow() {
    isInfoWindowOpen.value = !isInfoWindowOpen.value;
    update();
  }

  void closeInfoWindow() {
    if (isInfoWindowOpen.value) {
      isInfoWindowOpen.value = false;
    }
    update();
  }
}
