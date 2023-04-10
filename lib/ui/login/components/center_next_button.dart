import 'package:animations/animations.dart';
import 'package:chumsy/constants/globals.dart';
import 'package:flutter/material.dart';

class CenterNextButton extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onLogin;
  final VoidCallback onSignUp;

  const CenterNextButton(
      {Key? key,
      required this.animationController,
      required this.onLogin,
      required this.onSignUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topMoveAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final signUpMoveAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final loginTextMoveAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return Padding(
      padding:
          EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: topMoveAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => AnimatedOpacity(
                opacity: animationController.value >= 0.2 &&
                        animationController.value <= 0.6
                    ? 1
                    : 0,
                duration: const Duration(milliseconds: 480),
                child: _pageView(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SlideTransition(
              position: loginTextMoveAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome to Chumsy!',
                    style: TextStyle(
                      color: Color(0xff282828),
                      fontFamily: "Proxima Nova",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          SlideTransition(
            // Sign Up button
            position: topMoveAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => Padding(
                padding: const EdgeInsets.only(
                    bottom: LoginConstants.buttonColumnSpacing),
                child: Container(
                  height: 51,
                  // width: 58 + (200 * signUpMoveAnimation.value),
                  width: 276,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8 + 32),
                    color: const Color(0xff282828),
                  ),
                  child: PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 480),
                      reverse: signUpMoveAnimation.value < 0.7,
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                      ) {
                        return SharedAxisTransition(
                          fillColor: Colors.transparent,
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.vertical,
                          child: child,
                        );
                      },
                      child: /*signUpMoveAnimation.value > 0.7
                        ? */
                          InkWell(
                        key: const ValueKey('Sign Up button'),
                        onTap: onSignUp,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                              // ,
                              // Icon(Icons.arrow_forward_rounded,
                              //     color: Colors.white),
                            ],
                          ),
                        ),
                      )
                      // : InkWell(
                      //     key: const ValueKey('next button'),
                      //     onTap: onNextClick,
                      //     child: const Padding(
                      //       padding: EdgeInsets.all(16.0),
                      //       child: Icon(Icons.arrow_forward_ios_rounded,
                      //           color: Colors.white),
                      //     ),
                      //   ),
                      ),
                ),
              ),
            ),
          ),
          SlideTransition(
            // Login Button
            position: topMoveAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => Padding(
                padding: const EdgeInsets.only(
                    bottom: LoginConstants.buttonColumnSpacing),
                child: Container(
                  height: 51,
                  width: 276,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                      border: Border.all(color: const Color(0xff282828))),
                  child: PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 480),
                      reverse: signUpMoveAnimation.value < 0.7,
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                      ) {
                        return SharedAxisTransition(
                          fillColor: Colors.transparent,
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.vertical,
                          child: child,
                        );
                      },
                      child: InkWell(
                        key: const ValueKey('Login In button'),
                        onTap: onLogin,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Login',
                                style: TextStyle(
                                  color: Color(0xff282828),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                              // ,
                              // Icon(Icons.arrow_forward_rounded,
                              //     color: Colors.white),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: SlideTransition(
              position: loginTextMoveAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Change language ',
                    style: TextStyle(
                      color: Color(0xff282828),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageView() {
    int selectedIndex = 0;

    if (animationController.value >= 0.7) {
      selectedIndex = 3;
    } else if (animationController.value >= 0.5) {
      selectedIndex = 2;
    } else if (animationController.value >= 0.3) {
      selectedIndex = 1;
    } else if (animationController.value >= 0.1) {
      selectedIndex = 0;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 480),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: const Color(0xff132137), width: 2),
                  color: selectedIndex == i
                      ? const Color(0xffc5fcdc)
                      : const Color(0xff132137),
                ),
                width: 15,
                height: 15,
              ),
            )
        ],
      ),
    );
  }
}
