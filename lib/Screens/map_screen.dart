import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Controllers/bnb_controller.dart';
import 'package:chumsy_app/Controllers/map_screen_controllers.dart';
import 'package:chumsy_app/Screens/Create_Event/create_event_screen.dart';
import 'package:chumsy_app/Screens/Filter_screens/filter_home.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/gradient_widget.dart';
import 'package:chumsy_app/Widgets/My_Events/running_bottom_sheet.dart';
import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../Constants/sizes.dart';
import '../Constants/spacing.dart';
import '../Widgets/map_bottom_container.dart';
import 'Help_Center/front_screen.dart';
import 'Help_Center/mng_bottom_nav.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final MapScreenControllers mapScreenControllers =
        Get.put(MapScreenControllers());
    final BNBController bnbController = Get.put(BNBController());
    final TextEditingController searchCont = TextEditingController();

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => mapScreenControllers.closeInfoWindow(),
        child: Container(
          decoration: const BoxDecoration(
            color: whiteColor,
            image: DecorationImage(
              image: AssetImage(
                "assets/extras/map.png",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  60,
                  16,
                  20,
                ),
                child: Obx(
                  () => Stack(
                    children: [
                      Positioned(
                        top: screenHeight / 3.5,
                        left: screenWidth / 8,
                        child: ElTooltip(
                          color: whiteColor,
                          content: Card(
                            child: Column(
                              children: const [
                                Text(
                                  "Tennis",
                                  style: regularStyleBold,
                                ),
                                Text(
                                  "5 min (500m)",
                                  style: regularStyle,
                                )
                              ],
                            ),
                          ),
                          child: CupertinoButton(
                            child: Image.asset(
                              "assets/home/map_bottom@2x.png",
                              width: 31.97,
                              height: 39.95,
                            ),
                            onPressed: () {
                              mapScreenControllers.toggleInfoWindow();
                            },
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 1,
                                child: SimpleShadow(
                                  offset: const Offset(2, 2),
                                  opacity: 0.2,
                                  child: Container(
                                    height: 44,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                        100,
                                      ),
                                      color: whiteColor,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 24.5,
                                      right: 12.6,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: CupertinoTextField(
                                            controller: searchCont,
                                            onTap: () {
                                              mapScreenControllers
                                                  .closeInfoWindow();
                                            },
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            placeholder: 'Search an event..',
                                            placeholderStyle: TextStyle(
                                                color:
                                                    textColor.withOpacity(0.7),
                                                fontSize: 14),
                                            prefix: const Icon(
                                              CupertinoIcons.search,
                                              color: blackColor,
                                            ),
                                            decoration: const BoxDecoration(
                                              color: whiteColor,
                                              border: Border(
                                                right: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFDEDEDE),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        CupertinoButton(
                                          onPressed: () {
                                            Get.to(() => const FilterHome());
                                          },
                                          padding: EdgeInsets.zero,
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          color: whiteColor,
                                          child: Image.asset(
                                            "assets/home/filter@3x.png",
                                            height: 17.14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              horizontalSpacingBox,
                              Expanded(
                                flex: 0,
                                child: GestureDetector(
                                  child: Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      color: blackColor,
                                      borderRadius: BorderRadius.circular(
                                        100,
                                      ),
                                    ),
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () =>
                                          Get.to(() => const MngHelpPages()),
                                      child: const Icon(
                                        CupertinoIcons.question,
                                        color: whiteColor,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CupertinoButton(
                                onPressed: () {},
                                color: blackColor,
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                                padding: EdgeInsets.zero,
                                child: const SizedBox(
                                  height: 43,
                                  width: 43,
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.location_fill,
                                      color: whiteColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              spacingBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (bnbController.showEventGoingButton.value)
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 35,
                                        ),
                                        child: CustomGradientButtonWidget(
                                          buttonWidget: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "EVENT IN PROGRESS",
                                                style: regularStyleBold,
                                              )
                                            ],
                                          ),
                                          onTapFunction: () {
                                            bnbController
                                                .changeEventGoinOnButton();
                                            runningEventBottomSheet(context);
                                          },
                                        ),
                                      ),
                                    ),
                                  CupertinoButton(
                                    onPressed: () {},
                                    color: blackColor,
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                    padding: EdgeInsets.zero,
                                    child: SizedBox(
                                      height: 43,
                                      width: 43,
                                      child: Center(
                                        child: Image.asset(
                                          "assets/home/Group 7522@3x.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          spacingBox,
                          const SizedBox(height: 5),
                          SimpleShadow(
                            offset: const Offset(2, 2),
                            opacity: 0.2,
                            child: CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () =>
                                  Get.to(() => const CreateEvent()),
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              child: const SizedBox(
                                height: 51,
                                child: Center(
                                  child: Text(
                                    'CREATE AN EVENT',
                                    style: regularStyleBold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (mapScreenControllers.isInfoWindowOpen.value)
                        MapBottomContainer(
                          mapScreenControllers: mapScreenControllers,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
