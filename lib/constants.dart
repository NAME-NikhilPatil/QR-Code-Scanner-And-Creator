import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
 

  static Color primaryColor = const Color(0xff00ABFF);
  static Color backgroundColor = const Color(0xffF9F9F9);
  static Color creamColor = const Color(0xffF7FBFF);

  static InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.r),
    borderSide: BorderSide(
      width: 2.h,
      color: Colors.grey.shade200,
    ),
  );
  static TextStyle errroStyle = TextStyle(
    fontSize: 15.sp,
    color: Colors.red,
  );
  static TextStyle hintStyle = TextStyle(
    fontSize: 15.sp,
    color: Colors.grey.shade500,
  );
  static TextStyle buttonText =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold);

  static TextStyle settingText = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  static ButtonStyle buttonStyle(Color primaryColor) {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      enableFeedback: true,
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h)),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      elevation: MaterialStateProperty.all<double>(3),
    );
  }
}
