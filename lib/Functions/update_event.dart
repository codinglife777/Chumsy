import 'package:chumsy_app/Screens/My_Events/update_event.dart';
import 'package:flutter/cupertino.dart';

Future<void> seeUpdateEvent(BuildContext context) {
  return showCupertinoModalPopup<void>(
      context: context, builder: (BuildContext context) => const UpdateEvent());
}
