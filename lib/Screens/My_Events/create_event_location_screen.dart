import 'package:chumsy_app/Constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Constants/colors.dart';
import '../../Constants/spacing.dart';
import '../../Widgets/Create_Event/app_bar.dart';
import 'choose_map_screen.dart';

class CreateEventLocation extends StatefulWidget {
  const CreateEventLocation({super.key});

  @override
  State<CreateEventLocation> createState() => _CreateEventLocationState();
}

class _CreateEventLocationState extends State<CreateEventLocation> {
  final TextEditingController searchCont = TextEditingController();

  void clear() {}

  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                topSpacingBox,
                spacingBox,
                spacingBox,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(
                                0,
                                1,
                              ),
                              color: textColor,
                              blurRadius: 3,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            horizontalSpacingBox,
                            const Expanded(
                              flex: 0,
                              child: Icon(
                                CupertinoIcons.search,
                                color: blackColor,
                              ),
                            ),
                            horizontalSpacingBox,
                            Expanded(
                              flex: 1,
                              child: CupertinoTextField(
                                controller: searchCont,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                placeholder: l.searchLocation,
                                placeholderStyle: TextStyle(
                                  color: greyIconColor.withOpacity(0.5),
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      100,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      CupertinoListTile(
                        onTap: () => Get.to(() => const ChooseMapScreen()),
                        leading: const Icon(
                          CupertinoIcons.location_solid,
                          color: blackColor,
                          size: 22,
                        ),
                        title: Text(
                          l.myLocation,
                          style: regularStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 9.51,
                ),
                Divider(
                  thickness: 5,
                  color: textColor.withOpacity(
                    0.2,
                  ),
                ),
                const SizedBox(
                  height: 9.51,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          horizontalSpacingBox,
                          Expanded(
                            flex: 1,
                            child: Text(
                              l.recent,
                              style: regularStyleBold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const ShowHistoryTile(
                        title: "Swietokrzyska 56",
                      ),
                      const SizedBox(
                        height: 36.46,
                      ),
                      const ShowHistoryTile(
                        title: "Jerozolimskie 16",
                      ),
                      const SizedBox(
                        height: 36.46,
                      ),
                      const ShowHistoryTile(
                        title: "Chmielna 2",
                      ),
                      const SizedBox(
                        height: 36.46,
                      ),
                      const ShowHistoryTile(
                        title: "Puiawska IO",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          EventAppBar(
            title: AppLocalizations.of(context)!.location,
            cbClear: clear,
          ),
        ],
      ),
    );
  }
}

class ShowHistoryTile extends StatelessWidget {
  const ShowHistoryTile({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      onTap: () => Get.to(() => const ChooseMapScreen()),
      leading: const Icon(
        Icons.history,
        color: blackColor,
      ),
      title: Text(
        title,
        style: regularStyle,
      ),
    );
  }
}
