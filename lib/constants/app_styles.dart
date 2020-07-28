import 'package:flutter/material.dart';
import 'package:skype_clone/constants/app_colors.dart';

TextStyle text(double sp, {FontWeight fw, Color color}) {
  return TextStyle(
    color: color ?? kBlackColor,
    fontSize: sp,
    fontWeight: fw ?? FontWeight.normal,
  );
}
