import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

import '../Controllers/image_controller.dart';
import '../Widgets/chumsyerrordialog.dart';

Future<bool> hasFace(String filePath) async {
  final options = FaceDetectorOptions();
  final faceDetector = FaceDetector(options: options);

  final inputImage = InputImage.fromFilePath(filePath);
  final List<Face> faces = await faceDetector.processImage(inputImage);

  return faces.isNotEmpty;
}

Future<void> _dialogBuilder(BuildContext context, String errorMessage) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return ChumsyErrorDialog(errorMessage: errorMessage);
    },
  );
}

void showActionSheet(
    BuildContext context, ImageController imageController, String secondText) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Theme(
      data: ThemeData.light(),
      child: CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform
                  .pickFiles(type: FileType.image, allowMultiple: false);
              if (result != null) {
                String file = result.files.single.path!;
                bool face = await hasFace(file);
                Get.put(ImageController()).setNoFace(!face);
                if (!face) {
                  Get.back();
                  // ignore: use_build_context_synchronously
                  // if (kDebugMode) {
                  //   print("No face");
                  // }
                  _dialogBuilder(
                      context, "Photo you have selected should have a face");
                  return;
                }

                Get.put(ImageController()).setImage(file);
                if (kDebugMode) {
                  print(file);
                }
              } else {
                Get.back();
                return;
              }
              imageController.changeImage(true);
              Get.back();
            },
            child: const Text('Photo Library'),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              // final ImagePicker picker = ImagePicker();
              // final pickedFile =
              //     await picker.pickImage(source: ImageSource.camera);
              // File imgFile = File(pickedFile!.path);

              // bool face = await hasFace(imgFile.path);
              // Get.put(ImageController()).setNoFace(!face);
              // if (!face) {
              //   Get.back();
              //   _dialogBuilder(
              //       context, "Photo you have selected should have a face");
              //   // ignore: use_build_context_synchronously
              //   return;
              // }

              // Get.put(ImageController()).setImage(imgFile.path);
              // if (kDebugMode) {
              //   print(imgFile.path);
              // }
              imageController.changeImage(true);
              Get.back();
            },
            child: Text(secondText),
          ),
        ],
      ),
    ),
  );
}
