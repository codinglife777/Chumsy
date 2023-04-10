import 'dart:async';
import 'package:chumsy/ui/login/home.dart';
import 'package:chumsy/ui/login/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    if (kDebugMode) {
      print("Spalsh end");
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  initScreen(BuildContext context) {
    var windowWidth = MediaQuery.of(context).size.width;
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFD8FECB), Color(0xFFA5FAFA)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: "SplashLogo",
                      child: SizedBox(
                        width: windowWidth * 0.3,
                        child: Image.asset("assets/logo/logo.png",
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
