import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_e_ramo/Core/config/app_color.dart';

abstract class TextStyleClass {
  static TextStyle headStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white, fontSize: 20.sp, fontFamily: 'cairo', fontWeight: FontWeight.bold);
  }
  static TextStyle bigStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white, fontSize: 24.sp, fontFamily: 'cairo',);
  }

  static TextStyle semiHeadStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white, fontSize: 18.sp, fontFamily: 'cairo',);
  }

  static TextStyle normalStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white, fontSize: 18.sp, fontFamily: 'cairo',);
  }

  static TextStyle smallStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white, fontSize: 14.sp, fontFamily: 'cairo',);
  }

  static TextStyle buttonStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white, fontSize: 16.sp, fontFamily: 'cairo',);
  }

  static TextStyle textFieldStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white, fontSize: 14.sp, fontFamily: 'cairo',);
  }

  static TextStyle captionStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white, fontSize: 16.sp, fontFamily: 'cairo',);
  }
  static TextStyle primaryStyle({Color? color}) {
    return TextStyle(color: color ?? AppColor.primaryColor, fontSize: 16.sp, fontFamily: 'cairo',);
  }
  static TextStyle seeAllStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white54, fontSize: 15.sp, fontFamily: 'cairo',);
  }
}
