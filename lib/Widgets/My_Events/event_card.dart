// event card used in finished and planned
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chumsy_app/Controllers/bnb_controller.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:chumsy_app/Widgets/My_Events/planned_bottom_sheet.dart';
import 'package:chumsy_app/Widgets/My_Events/share_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/sizes.dart';
import '../../Constants/spacing.dart';
import '../../Screens/Create_Event/create_event_screen.dart';
import '../../Screens/My_Events/update_event.dart';
import '../../Screens/Registration_Screens/login_screen.dart';
import '../Extra Widgets/list_set_of_widgets.dart';
import '../Extra Widgets/simple_button_widget.dart';
import '../options_list.dart';
import 'custom_state.dart';
import 'finished_bottom_sheet.dart';

class CustomMyEventCard extends StatefulWidget {
  const CustomMyEventCard(
      {Key? key,
      required this.name,
      required this.time,
      required this.month,
      required this.cardTitle,
      required this.date,
      required this.profileLocation,
      required this.buttonText,
      required this.subName,
      required this.cardSubTitle,
      required this.updateEvent})
      : super(key: key);
  final String name,
      time,
      month,
      cardTitle,
      date,
      profileLocation,
      buttonText,
      subName,
      cardSubTitle;
  final VoidCallback updateEvent;

  @override
  State<CustomMyEventCard> createState() => _CustomMyEventCardState();
}

class _CustomMyEventCardState extends State<CustomMyEventCard> {
  bool cancelSate = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BNBController>(
        init: BNBController(),
        builder: (controller) => Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: widget.buttonText.contains("PAYMENT")
                      ? eventCardColor
                      : whiteColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      width: 2,
                                      color: blackColor,
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CupertinoListTile(
                                      padding: EdgeInsets.zero,
                                      title: AutoSizeText(
                                        widget.cardTitle,
                                        style: regularStyleBold.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                      subtitle: AutoSizeText(
                                        widget.cardSubTitle,
                                        style: smallStyle,
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                    ),
                                    spacingBox,
                                    CupertinoListTile(
                                      padding: EdgeInsets.zero,
                                      leading: CircleAvatar(
                                        backgroundColor: eventCardColor,
                                        foregroundImage:
                                            AssetImage(widget.profileLocation),
                                      ),
                                      leadingSize: 39,
                                      title: AutoSizeText(
                                        widget.name,
                                        style: regularStyleBold.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                      subtitle: AutoSizeText(
                                        widget.subName,
                                        style: smallStyle,
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Container(
                                padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                      widget.month,
                                      style: smallStyleBold,
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                    spacingBoxSmall,
                                    AutoSizeText(
                                      widget.date,
                                      style: headingStyle24.copyWith(
                                        fontSize: 25,
                                      ),
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                    spacingBoxSmall,
                                    AutoSizeText(
                                      widget.time,
                                      style: regularStyleBold,
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        spacingBox,
                        CustomGradientButtonWidget(
                          buttonWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                widget.buttonText,
                                style: regularStyleBold,
                                maxLines: 1,
                                softWrap: true,
                              ),
                            ],
                          ),
                          onTapFunction: () {
                            if (widget.buttonText.contains("MANAGE")) {
                              plannedEventBottomSheet(
                                  context,
                                  "assets/extras/bottomBack2.png",
                                  widget.profileLocation,
                                  widget.cardTitle,
                                  widget.name,
                                  "26",
                                  widget.cardSubTitle,
                                  widget.updateEvent);
                            } else if (widget.buttonText.contains("SEE")) {
                              finishedEventBottomSheet(
                                  context,
                                  "assets/extras/bottomBack1.png",
                                  widget.profileLocation,
                                  widget.cardTitle,
                                  widget.name,
                                  "26",
                                  widget.cardSubTitle);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  if (widget.buttonText.contains("PAYMENT"))
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: eventCardColor,
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "\$",
                              style: regularStyleBold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ));
  }

  Future<void> plannedEventBottomSheet(
      BuildContext context,
      String bgImage,
      String dp,
      String tite,
      String name,
      String age,
      String location,
      VoidCallback updateEvent) {
    AppLocalizations l = AppLocalizations.of(context)!;
    bool cancelState1 = true;
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => SlidingUpPanel(
        backdropEnabled: true,
        body: Image.asset(
          bgImage,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
        maxHeight: screenHeight - 200,
        minHeight: screenHeight / 1.6,
        onPanelSlide: (position) {
          print(position);
        },
        onPanelClosed: () {
          Get.back();
        },
        panel: GestureDetector(
          onVerticalDragUpdate: (details) {
            print(details.delta.dy);
            if (details.delta.dy > 0) {
              // _panelController.close(); // Close the panel when dragging down
              Get.back();
            }
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 35,
                    ),
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                  ]),
                  CupertinoButton(
                    padding: const EdgeInsets.only(right: 20),
                    onPressed: () {
                      openShareBottomSheet(context);
                    },
                    child: const Icon(
                      Icons.more_horiz_rounded,
                      color: blackColor,
                      size: 40,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 40,
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tite,
                      style: subHeadingStyle,
                    ),
                    spacingBox,
                    CupertinoListTile(
                      padding: EdgeInsets.zero,
                      leadingSize: 40,
                      leading: CircleAvatar(
                        backgroundColor: neonColor,
                        foregroundImage: AssetImage(dp),
                      ),
                      title: Text(
                        "$name, $age ",
                        style: subHeadingStyle,
                      ),
                      subtitle: Text(
                        location,
                        style: regularStyle,
                      ),
                      trailing: CupertinoButton(
                        padding: EdgeInsets.zero,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        onPressed: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                            gradient: const LinearGradient(
                              colors: [
                                neonColor,
                                blueColor,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/home/chat_bottom@2x.png",
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    spacingBox,
                    Row(
                      children: const [
                        Expanded(
                          flex: 0,
                          child: Icon(
                            CupertinoIcons.time,
                            color: blackColor,
                          ),
                        ),
                        horizontalSpacingBox,
                        Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            "Monday, April 12 | 11:00 AM. 12:00 PM",
                            style: regularStyle,
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    spacingBox,
                    Row(
                      children: const [
                        Expanded(
                          flex: 0,
                          child: Icon(
                            Icons.location_on_outlined,
                            color: blackColor,
                          ),
                        ),
                        horizontalSpacingBox,
                        Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            "Korty Tenisowe Warszawianka Piaseczynska 71.00-765 Warszawa. Polska",
                            style: smallStyle,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    spacingBox,
                    const AutoSizeText(
                      "This is the event description, lorem ipsum dolor sit amet. consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      style: regularStyle,
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    spacingBox,
                    ChipSets(
                      islarge: false,
                      listOfChips: options,
                      readonly: true,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomSimpleuttonWidget(
                            buttonWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  l.cancelC,
                                  style: regularStyleBold,
                                ),
                              ],
                            ),
                            onTapFunction: () {
                              showCupertinoDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (context) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        30,
                                      ),
                                      color: whiteColor,
                                    ),
                                    padding: const EdgeInsets.all(
                                      2,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: screenHeight / 4,
                                    ),
                                    child: const CustomState()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomGradientButtonWidget(
                            buttonWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  l.edit,
                                  style: regularStyleBold,
                                ),
                              ],
                            ),
                            onTapFunction: () {
                              // Get.replace(const UpdateEvent());
                              // Get.back();
                              updateEvent();
                              // Get.put(() => const LoginScreen());
                              // updateEvent();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
