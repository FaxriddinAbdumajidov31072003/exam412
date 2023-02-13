import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  // ---------- Color   ---------- //

  static const primaryColor = Color(0xffF43F5E);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const blueColor = Colors.blue;
  static const wrapColor = Color(0xff2972FE);
  static const labelColor = Color(0xffDADEE3);
  static const answerColor = Color(0xff394452);
  static const notanswerColor = Color(0xffF43F5E);
  static const backColor = Color(0xff1E1E1E);
  static const offColor = Color(0xff93B8FE);
  static const darkBgcolorOfApp = Color(0xff0D0D0D);

  // ---------- Gradient   ---------- //

  static const linearGradient = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xffFF1843),
        Color(0xffFF7E95),
      ]);

  static const primaryDisabledColor = Color.fromARGB(244, 235, 134, 164);



  static textStyleRegular(
      {double size = 18,
        Color textColor = blackColor,

      }) =>
      GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w600,
          color: textColor,


          fontSize: size
      );


  static textStyleRegular2(
      {double size = 16,
        Color textColor = blackColor,

      }) =>
      GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: size
      );
  static textStyleBig(
      {double size = 26,
        Color textColor = blackColor,

      }) =>
      GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: size
      );

}
