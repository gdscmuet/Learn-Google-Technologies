import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluish=Color(0xFF4e5ae8);

class Themes{
  static final light=ThemeData(         
        backgroundColor: Colors.white,
        primaryColor:bluish,   //only applies on appBar and buttons
        brightness: Brightness.light, //responsible for background and text colour
      );

  static final dark=ThemeData(
        primaryColor: Colors.grey,
        brightness: Brightness.dark,
      );
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color:Get.isDarkMode?Colors.grey[400]:Colors.grey
    )
  );
}


TextStyle get HeadingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold
    )
  );
}

TextStyle get InputFieldStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold
    )
  );
}