import 'package:chumsy_app/Constants/colors.dart';
import 'package:chumsy_app/Screens/Registration_Screens/splash_screen.dart';
import 'package:chumsy_app/Widgets/Extra%20Widgets/dismiss_keyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Screens/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DismissKeyboard(
      child: GetCupertinoApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        locale: Locale('pl', ''),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('pl', ''),
          Locale('uk', ''),
          Locale('es', ''),
          Locale('ru', ''),
        ],
        theme: CupertinoThemeData.raw(
          Brightness.light,
          blackColor,
          whiteColor,
          CupertinoTextThemeData(
            textStyle: TextStyle(
              fontFamily: "Proxima",
              color: blackColor,
            ),
          ),
          whiteColor,
          whiteColor,
        ),
        home: LandingPage(),
      ),
    );
  }
}
