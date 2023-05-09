import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static BoxDecoration splashScreenBackground() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xffD8FECB),
          Color(0xffA5FAFA),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  static BoxDecoration snackBarContainer() {
    return BoxDecoration(
      color: Colors.blueGrey[900],
    );
  }

  static TextStyle welcomeText() {
    return GoogleFonts.montserrat(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: .1,
    );
  }

  static TextStyle headingStyle({Color? color, double? fontSize}) {
    return GoogleFonts.montserrat(
      fontSize: fontSize ?? 22,
      fontWeight: FontWeight.bold,
      color: color ?? const Color(0xff282828),
    );
  }

  static TextStyle headingStyleDark(
      {FontWeight? fontWeight, double? fontSize}) {
    return GoogleFonts.montserrat(
      fontSize: fontSize ?? 22,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle regularText(
      {fontWeight = FontWeight.normal,
      underline = false,
      Color? color,
      double? fontSize}) {
    return GoogleFonts.montserrat(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      color: color ?? const Color(0xff282828),
    );
  }

  static BoxDecoration callToAction() {
    return const BoxDecoration(
      color: Color(0xff282828),
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    );
  }

  static TextStyle callToActionText() {
    return GoogleFonts.montserrat(
      color: Colors.white,
      fontWeight: FontWeight.w900,
    );
  }

  static BoxDecoration greyButton(
      {Color? backgroundColor, Color? borderColor, List<BoxShadow>? shadow}) {
    return BoxDecoration(
        color: backgroundColor ?? const Color(0xffEFEFEF),
        border: Border.all(
            color: borderColor ?? const Color(0xff282828),
            width: 2,
            style: BorderStyle.solid),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: shadow ??
            [
              const BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 0,
                  offset: Offset(0, 0))
            ]);
  }

  static LinearGradient primaryGradient() {
    return const LinearGradient(colors: [
      Color(0xFFD7FDCB),
      Color(0xFFB3FDEB),
    ], begin: Alignment.centerLeft, end: Alignment.centerRight);
  }

  static BoxDecoration gredientButtonContainer({Color? borderColor}) {
    return BoxDecoration(
      gradient: primaryGradient(),
      border: Border.all(
          color: borderColor ?? const Color(0xff282828),
          width: 2,
          style: BorderStyle.solid),
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
    );
  }

  static TextStyle darkBackgroundTextHeading() {
    return GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle greyButtonText(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return GoogleFonts.montserrat(
      color: color ?? const Color(0xff282828),
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w900,
    );
  }

  static TextStyle bottomMenuButtonText() {
    return GoogleFonts.montserrat(
      fontSize: 20,
    );
  }

  static BoxDecoration secondaryButtonContainer() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      border: Border.all(
          color: const Color(0xff282828), style: BorderStyle.solid, width: 2),
    );
  }

  static TextStyle secondaryButtonText() {
    return GoogleFonts.montserrat(
      color: Color(0xff282828),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle tertiaryButtonText() {
    return GoogleFonts.montserrat(
      color: Color(0xff282828),
      fontWeight: FontWeight.w600,
      fontSize: 14,
      decoration: TextDecoration.underline,
    );
  }

  static BoxDecoration textFieldContainer(
      {Color? backgroundColor, Color? borderColor}) {
    return BoxDecoration(
      border: Border.all(
          color: borderColor ?? Color(0xff282828),
          style: BorderStyle.solid,
          width: 2),
      color: backgroundColor ?? Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(30),
      ),
    );
  }

  static TextStyle textFieldText({weight = FontWeight.w500}) {
    return GoogleFonts.montserrat(
      fontWeight: FontWeight.w500,
      color: Color(0xff282828),
    );
  }

  static InputDecoration textFieldDecoration({
    hintText = "",
    suffexText = "",
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: textFieldText(),
      suffix: Text(suffexText),
      suffixStyle: textFieldText(),
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(top: 0, bottom: 0),
    );
  }

  static BoxDecoration customTextButtonStyle(
      {Color? backgroundColor, Color? borderColor}) {
    return BoxDecoration(
      color: backgroundColor ?? Colors.white,
      border: Border(
        bottom: BorderSide(
          width: 2,
          color: borderColor ?? const Color(0xffF9F9F9),
        ),
      ),
    );
  }
}
