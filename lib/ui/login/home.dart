import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chumsy/ui/common/common.dart';
import 'package:chumsy/ui/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:chumsy/utils/show_toast.dart';
import 'package:card_swiper/card_swiper.dart';

import 'login.dart';

class SwipItem {
  SwipItem({this.title = '', this.imagePath = ''});

  String title;
  String imagePath;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _txtUserName = TextEditingController();
  final TextEditingController _txtPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void firebaseSetup() {
    // FirebaseMessaging.instance.getToken().then((fcmToken) {
    //   if (fcmToken != null) {
    //     WorkerService.updateDeviceToken(fcmToken);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode =
        AdaptiveTheme.of(context).brightness == Brightness.light;
    final List<SwipItem> swipItems = [
      SwipItem(title: "Sport", imagePath: 'assets/login/sports.png'),
      SwipItem(title: "Lifestyle", imagePath: 'assets/login/lifestyle@2x.png'),
      SwipItem(title: "Your name it", imagePath: 'assets/login/nameit@2x.png'),
    ];

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return ProgressHUD(
        indicatorColor: AdaptiveTheme.of(context).theme.colorScheme.background,
        backgroundColor: AdaptiveTheme.of(context).theme.colorScheme.onSurface,
        child: Builder(
            builder: (context) => Scaffold(
                  backgroundColor: Colors.white,
                  body: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: screenHeight * 0.1),
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: screenWidth * 0.8,
                            height: screenHeight * 0.55,
                            child: Swiper(
                              itemBuilder: (context, index) {
                                final image = swipItems[index].imagePath;
                                return Column(children: [
                                  Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        swipItems[index].title,
                                        style: const TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      )),
                                  Container(
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image(
                                        image: AssetImage(image),
                                        fit: BoxFit.contain, // use this
                                      ),
                                    ),
                                  )
                                ]);
                              },
                              indicatorLayout: PageIndicatorLayout.COLOR,
                              autoplay: false,
                              itemCount: swipItems.length,
                              pagination: const SwiperPagination(
                                  builder: DotSwiperPaginationBuilder(
                                      color: Color(0xff282828),
                                      activeColor: Color(0xFFB3FBED),
                                      space: 10,
                                      activeSize: 20)),
                              // control: const SwiperControl(),
                            ),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            'Welcome to Chumsy!',
                            style: TextStyle(
                              color: Color(0xff282828),
                              fontFamily: "Proxima Nova",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 51,
                          // width: 58 + (200 * signUpMoveAnimation.value),
                          width: 276,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8 + 32),
                            color: const Color(0xff282828),
                          ),
                          child: InkWell(
                            key: const ValueKey('Sign Up button'),
                            onTap: () {
                              // Navigator.pushNamed(context, '/register');
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const Register()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'SIGN UP',
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
                          )),
                      Container(
                        height: 51,
                        width: 276,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            border: Border.all(color: const Color(0xff282828))),
                        child: InkWell(
                          key: const ValueKey('Login In button'),
                          onTap: () {
                            // Navigator.pushNamed(context, '/login');
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'LOG IN',
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
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text(
                            'Change language ',
                            style: TextStyle(
                              color: Color(0xff282828),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                          ))
                    ],
                  ),
                )));
  }
}
