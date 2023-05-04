// Create a custom triangle
import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Constants/sizes.dart';
import 'package:flutter/cupertino.dart';

// Sent message bubble
class OutBubble extends StatelessWidget {
  final String message;
  const OutBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            width: screenWidth / 3,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  neonColor,
                  blueColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19),
                bottomLeft: Radius.circular(19),
                bottomRight: Radius.circular(4),
                topRight: Radius.circular(19),
              ),
            ),
            child: Text(
              message,
              style: smallStyle,
            ),
          ),
        ),
      ],
    );
  }
}

// Received message bubble
class InBubble extends StatelessWidget {
  final String message;
  const InBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            width: screenWidth / 3,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  textColor.withOpacity(0.3),
                  textColor.withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4),
                topLeft: Radius.circular(19),
                bottomRight: Radius.circular(19),
                topRight: Radius.circular(19),
              ),
            ),
            child: Text(
              message,
              style: smallStyle,
            ),
          ),
        ),
      ],
    );
  }
}
