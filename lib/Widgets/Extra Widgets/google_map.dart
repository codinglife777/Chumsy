import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../Constants/colors.dart';
import '../../Constants/globals.dart';
import '../../Constants/sizes.dart';
import '../../Screens/Help_Center/mng_bottom_nav.dart';
import '../../Styles/styles.dart';

class MainMap extends StatefulWidget {
  const MainMap({Key? key}) : super(key: key);

  @override
  State<MainMap> createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(0, 0), zoom: 3);

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _mapControler.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return
        // GestureDetector(
        //   onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        //   child:
        Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.white,
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (controller) async {
              _controller.complete(controller);
              // _googleMapController.complete(controller);
              // // setState(() {
              // _mapControler = controller;
              // // });
            },
            // myLocationEnabled: true,
            // //  liteModeEnabled: Platform.isAndroid ? true : false,
            // zoomControlsEnabled: true,
            // myLocationButtonEnabled: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 58, left: 10, right: 18),
            child: Row(
              children: [
                GestureDetector(
                  child: Container(
                    height: 44,
                    width: 44,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Get.back(closeOverlays: true),
                      child: const Icon(
                        CupertinoIcons.left_chevron,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 44,
                  width: screenWidth / 3.5,
                  decoration: Styles.greyButton(
                    backgroundColor: Colors.white,
                    borderColor: Colors.white,
                    shadow: [
                      const BoxShadow(
                          color: Color(0x17000000),
                          offset: Offset(0, 3),
                          blurRadius: 6),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Expanded(
                      //   flex: 1,
                      //   child: SimpleShadow(
                      //     offset: const Offset(2, 2),
                      //     opacity: 0.2,
                      //     child: Container(
                      //       height: 44,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadiusDirectional.circular(
                      //           100,
                      //         ),
                      //         color: whiteColor,
                      //       ),
                      //       padding: const EdgeInsets.only(
                      //         left: 24.5,
                      //         right: 12.6,
                      //       ),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Expanded(
                      //             child: CupertinoTextField(
                      //               // controller: searchCont,
                      //               onTap: () {
                      //                 // mapScreenControllers
                      //                 //     .closeInfoWindow();
                      //               },
                      //               padding: const EdgeInsets.symmetric(
                      //                 horizontal: 16,
                      //               ),
                      //               placeholder: 'Search an event..',
                      //               placeholderStyle: TextStyle(
                      //                   color: textColor.withOpacity(0.7),
                      //                   fontSize: 14),
                      //               suffix: const Icon(
                      //                 CupertinoIcons.search,
                      //                 color: blackColor,
                      //               ),
                      //               decoration: const BoxDecoration(
                      //                 color: whiteColor,
                      //                 border: Border(
                      //                   right: BorderSide(
                      //                     width: 1,
                      //                     color: Color(0xFFDEDEDE),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 44,
                  width: 44,
                  decoration: Styles.greyButton(
                    backgroundColor: const Color(0xff282828),
                    borderColor: const Color(0xff282828),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "?",
                      style: Styles.greyButtonText(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Positioned(
          //   bottom: 33,
          //   child: Container(
          //     margin: EdgeInsets.only(left: screenWidth < 389 ? 8 : 18),
          //     height: 51,
          //     width: screenWidth / 1.5,
          //     decoration: Styles.greyButton(shadow: [
          //       const BoxShadow(
          //           color: Color(0x17000000),
          //           offset: Offset(0, 3),
          //           blurRadius: 6),
          //     ], backgroundColor: Colors.white, borderColor: Colors.white),
          //     child: TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         AppLocalizations.of(context)!.createAnEvent.toUpperCase(),
          //         style: Styles.greyButtonText(fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      // ),
    );
  }
}
