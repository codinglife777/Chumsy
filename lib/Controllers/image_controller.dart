import 'dart:io';

import 'package:get/get.dart';

class ImageController extends GetxController {
  RxBool showImage = false.obs;
  Rx<File> image = File("").obs;
  RxBool noFace = false.obs;

  void setImage(String selectedImage) {
    image.value = File(selectedImage);
    update();
  }

  void changeImage(bool value) {
    showImage.value = value;
    update();
  }

  void setNoFace(bool value) {
    noFace.value = value;
    update();
  }
}
