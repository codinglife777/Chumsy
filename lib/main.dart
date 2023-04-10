import 'dart:io';

import 'package:chumsy/ui/home/index.dart';
import 'package:chumsy/ui/login/index.dart';
import 'package:chumsy/ui/login/login.dart';
import 'package:chumsy/ui/register/profile_age.dart';
import 'package:chumsy/ui/register/profile_quailifications.dart';
import 'package:chumsy/ui/register/register.dart';
import 'package:chumsy/ui/login/verification_code.dart';
import 'package:chumsy/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue,
          onPrimary: Colors.white12,
          secondary: Colors.green,
          onSecondary: Color(0xFFEEEFEF),
          primaryContainer: Color(0xff0840B2),
          error: Colors.white,
          onError: Color(0xffB2E6FE),
          background: Color(0xffFAFAFA),
          onBackground: Color(0xff282828),
          surface: Colors.white,
          onSurface: Colors.black54,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff282828), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
        ),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xff3700B3),
          onPrimary: Colors.black12,
          secondary: Color(0xff03DAC6),
          onSecondary: Color(0xff2D2D2D),
          primaryContainer: Color(0xffBB86FC),
          error: Color(0xff424242),
          onError: Color(0xff2D2D2D),
          background: Color(0xff121212),
          onBackground: Colors.white,
          surface: Color(0xff1E1E1E),
          onSurface: Colors.white54,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff3700B3)),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          // '/': (context) => const HomeView(),
          '/': (context) => const SplashScreen(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/verification_code': (context) => const VerificationCode(),
          '/profile_age': (context) => const ProfileAge()
        },
        // home: const NavigationMenu(),
      ),
    );
  }
}
