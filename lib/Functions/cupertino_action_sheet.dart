import 'dart:io';

import 'package:chumsy_app/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../Controllers/image_controller.dart';
import '../Widgets/chumsyerrordialog.dart';
import '../providers/locale_provider.dart';

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

void showChangeLanguageAction(BuildContext context) {
  AppLocalizations l = AppLocalizations.of(context)!;
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
          child: Text(
            AppLocalizations.of(context)!.cancel,
            style: const TextStyle(color: Colors.red),
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {},
            child: Text(l.selectLanguage,
                style: smallStyle.copyWith(fontWeight: FontWeight.bold)),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              context.read<LocaleProvider>().setLocale(const Locale("en"));
              Get.back();
            },
            child: Text(l.english, style: const TextStyle(color: Colors.black)),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              context.read<LocaleProvider>().setLocale(const Locale("pl"));
              Get.back();
            },
            child: Text(l.polski, style: const TextStyle(color: Colors.black)),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              // context.read<LocaleProvider>().setLocale(const Locale("ua"));
              // Get.back();
            },
            child:
                Text(l.ukrainian, style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    ),
  );
}

dynamic defaultFunc() {}

void showActionSheet(BuildContext context, ImageController imageController,
    String firstText, String secondText, bool isFirstPhoto, bool checkFace,
    {VoidCallback cb = defaultFunc}) {
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
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform
                  .pickFiles(type: FileType.image, allowMultiple: false);
              if (result != null) {
                String file = result.files.single.path!;
                if (checkFace) {
                  bool face = await hasFace(file);
                  Get.put(ImageController()).setNoFace(!face);
                  if (!face) {
                    Get.back();
                    // ignore: use_build_context_synchronously
                    // if (kDebugMode) {
                    //   print("No face");
                    // }
                    _dialogBuilder(context,
                        AppLocalizations.of(context)!.photo_have_a_face);
                    return;
                  }
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
              cb();
            },
            child: Text(firstText),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.camera);
              File imgFile = File(pickedFile!.path);

              if (checkFace) {
                bool face = await hasFace(imgFile.path);
                Get.put(ImageController()).setNoFace(!face);
                if (!face) {
                  Get.back();
                  _dialogBuilder(
                      context, "Photo you have selected should have a face");
                  // ignore: use_build_context_synchronously
                  return;
                }
              }

              Get.put(ImageController()).setImage(imgFile.path);
              if (kDebugMode) {
                print(imgFile.path);
              }
              imageController.changeImage(true);
              Get.back();
              cb();
            },
            child: Text(secondText),
          ),
        ],
      ),
    ),
  );
}
