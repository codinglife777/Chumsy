import 'package:chumsy/ui/login/components/Lifestyle.dart';
import 'package:chumsy/ui/login/components/center_next_button.dart';
import 'package:chumsy/ui/login/components/nameit.dart';
import 'package:chumsy/ui/login/components/sport.dart';
import 'package:chumsy/ui/login/components/splash.dart';
import 'package:chumsy/ui/login/components/top_back_skip_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: _animationController!,
            ),
            SportView(
              animationController: _animationController!,
              onNext: _onNextClick,
            ),
            LifestyleView(
              animationController: _animationController!,
              onNext: _onNextClick,
            ),
            NameitView(
              animationController: _animationController!,
              onNext: _onNextClick,
            ),
            // WelcomeView(
            //   animationController: _animationController!,
            //   onNext: _onNextClick,
            // ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onSignUp: _signUpClick,
              onLogin: _loginClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: const Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      //_animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      //_animationController?.animateTo(0.8);
    }
  }

  void _loginClick() {
    Navigator.pushNamed(context, '/login');
  }

  void _signUpClick() {
    Navigator.pushNamed(context, '/register');
  }
}
