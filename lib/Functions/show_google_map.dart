import 'package:chumsy_app/Screens/My_Events/update_event.dart';
import 'package:flutter/cupertino.dart';

import '../Widgets/Extra Widgets/google_map.dart';

Future<void> showGoogleMap(BuildContext context) {
  return showCupertinoModalPopup<void>(
      context: context, builder: (BuildContext context) => const MainMap());
}
