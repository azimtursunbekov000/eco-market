import 'package:eco_market/internal/helpers/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextHelpers {
  static TextStyle titleS24W700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ThemeColor.colorText,
  );

  static TextStyle nameProductCategory = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: ThemeColor.colorNameProdCategory,
  );

  static TextStyle nameProduct = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ThemeColor.colorText,
  );

    static TextStyle hintText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ThemeColor.hintTextColor,
  );

  static TextStyle price = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: ThemeColor.priceColor,
  );
}
