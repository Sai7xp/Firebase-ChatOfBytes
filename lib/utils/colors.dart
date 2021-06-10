import 'package:flutter/material.dart';
class myColors {
  static String primary2 = '#2F2D52';
  static String primary1 = '#5F5BA5';
  static String primary = '#323232';

  static String secondary = '#F7C88C';
  
  static String pinkish = '#FF9075';
  static final Color blueColor = Color(0xff2b9ed4);
  static final Color blackColor = Color(0xffffffff);
  static final Color greyColor = Color(0xff8f8f8f);
  static final Color userCircleBackground = Color(0xff2b2b33);
  static final Color onlineDotColor = Color(0xff46dc64);
  static final Color lightBlueColor = Color(0xff0077d7);
  static final Color separatorColor = Color(0xffE7EEFB);

  static final Color gradientColorStart = Color(0xff5F5BA5);
  static final Color gradientColorEnd = Color(0xff2F2D52);

  static final Color senderColor = Color(0xffe7eefb);
  static final Color receiverColor = Color(0xffe4e0ff);

  static final Gradient fabGradient = LinearGradient(
      colors: [gradientColorStart, gradientColorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
}