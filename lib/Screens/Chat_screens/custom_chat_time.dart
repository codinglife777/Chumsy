import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Screens/Chat_screens/chatting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.name,
    required this.surName,
    required this.time,
    required this.profileLocation,
    required this.message,
  });
  final String name, surName, time, profileLocation, message;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      backgroundColorActivated: textColor.withOpacity(
        0.2,
      ),
      onTap: () => Get.to(
        () => ChattingScreen(
          name: name,
          surName: surName,
          image: profileLocation,
        ),
      ),
      padding: const EdgeInsets.only(
        bottom: 20.05,
      ),
      leading: Container(
          padding: EdgeInsets.zero,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: neonColor,
            foregroundImage: AssetImage(profileLocation),
          )),
      leadingSize: 62,
      title: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: regularStyleBold.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              surName,
              style: regularStyleBold.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ]),
      subtitle: AutoSizeText(
        message,
        style: const TextStyle(
          color: textColor,
          fontSize: 14,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: const TextStyle(
          color: textColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
