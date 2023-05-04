import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

import '../Controllers/image_controller.dart';

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
                Get.put(ImageController()).setImage(file);
                if (kDebugMode) {
                  print(file);
                }
              }
              imageController.changeImage(true);
              Get.back();
            },
            child: const Text('Photo Library'),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
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
