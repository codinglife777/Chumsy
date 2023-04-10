// ignore_for_file: non_constant_identifier_names

library chumsy.globals;

String g_userName = '';
String g_phoneNumber = '';

class LoginConstants {
  static const double buttonColumnSpacing = 16;
}

class LoginSplashList {
  LoginSplashList({
    this.title = '',
    this.imagePath = '',
  });

  String title;
  String imagePath;
}
