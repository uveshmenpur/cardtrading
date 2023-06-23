import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  TextStyles._();

  static String fontFamily = 'Montserrat';
  static String secondaryFontFamily = 'Sora';

  static FontWeight fwThin = FontWeight.w100;
  static FontWeight fwExtraLight = FontWeight.w200;
  static FontWeight fwLight = FontWeight.w300;
  static FontWeight fwRegular = FontWeight.w400;
  static FontWeight fwMedium = FontWeight.w500;
  static FontWeight fwSemiBold = FontWeight.w600;
  static FontWeight fwBold = FontWeight.w700;
  static FontWeight fwExtraBold = FontWeight.w800;

  static TextStyle get thin => TextStyle(
      fontSize: 14.sp,
      fontWeight: fwThin,
      fontFamily: fontFamily
  );
  static TextStyle get extraLight => TextStyle(
      fontSize: 14.sp,
      fontWeight: fwExtraLight,
      fontFamily: fontFamily
  );
  static TextStyle get light => TextStyle(
      fontSize: 14.sp,
      fontWeight: fwLight,
      fontFamily: fontFamily
  );
  static TextStyle get regular => TextStyle(
      fontSize: 14.sp,
      fontWeight: fwRegular,
      fontFamily: fontFamily
  );
  static TextStyle get medium => TextStyle(
      fontSize: 14.sp,
      fontWeight: fwMedium,
      fontFamily: fontFamily
  );
  static TextStyle get semiBold => TextStyle(
      fontSize: 14.sp,
      fontWeight: fwSemiBold,
      fontFamily: fontFamily
  );
  static TextStyle get bold => TextStyle(
      fontSize: 14.sp,
      fontWeight: fwBold,
      fontFamily: fontFamily
  );
  static TextStyle get extraBold => TextStyle(
    fontSize: 14.sp,
    fontWeight: fwExtraBold,
    fontFamily: fontFamily,

  );
}
