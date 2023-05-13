import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/globals.dart';
import '../../Constants/sizes.dart';
import '../../Styles/styles.dart';

class MainMap extends StatefulWidget {
  const MainMap({Key? key}) : super(key: key);

  @override
  State<MainMap> createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  Completer<GoogleMapController> _googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    final double searchContainerWidth =
        MediaQuery.of(context).size.width - 18 * 2 - 44 - 16;
    final double searchBoxWidth =
        searchContainerWidth - 24 - 13.3 - 22 - 17.7 - 13.3;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: (controller) async {
                _googleMapController.complete(controller);
              },
              myLocationEnabled: false,
              //  liteModeEnabled: Platform.isAndroid ? true : false,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(22, 22),
                zoom: 14,
              ),
              myLocationButtonEnabled: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 58, left: 18, right: 18),
              child: Row(
                children: [
                  Container(
                    height: 44,
                    width: searchContainerWidth,
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Image.asset('assets/extras/location@2x.png'),
                        ),
                        const SizedBox(
                          width: 13.3,
                        ),
                        SizedBox(
                          width: searchBoxWidth,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  AppLocalizations.of(context)!.searchAnEvent,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
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
            Positioned(
              bottom: 151,
              right: 18,
              child: Container(
                height: 44,
                width: 44,
                decoration: Styles.greyButton(
                  backgroundColor: const Color(0xff282828),
                  borderColor: const Color(0xff282828),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/home/mylocation@1x.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 97,
              right: 18,
              child: Container(
                height: 44,
                width: 44,
                decoration: Styles.greyButton(
                  backgroundColor: const Color(0xff282828),
                  borderColor: const Color(0xff282828),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/home/send.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 33,
              child: Container(
                margin: EdgeInsets.only(left: screenWidth < 389 ? 8 : 18),
                height: 51,
                width: screenWidth - (screenWidth < 389 ? 8 : 18) * 2,
                decoration: Styles.greyButton(shadow: [
                  const BoxShadow(
                      color: Color(0x17000000),
                      offset: Offset(0, 3),
                      blurRadius: 6),
                ], backgroundColor: Colors.white, borderColor: Colors.white),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.createAnEvent.toUpperCase(),
                    style: Styles.greyButtonText(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
