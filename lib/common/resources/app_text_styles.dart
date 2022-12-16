import 'package:flutter/material.dart';
import 'package:own_inbox_app/common/resources/app_colors.dart';
import 'package:own_inbox_app/common/resources/app_fonts.dart';

class AppTextStyles {
  static const TextStyle blackS12W700 = TextStyle(
    // fontWeight: FontWeight.w700,
    fontFamily: AppFonts.fontFamily,
    fontSize: 12,
    color: AppColors.neutral900,
  );

  static const TextStyle whiteS12W500 = TextStyle(
    fontWeight: FontWeight.w500,
    // fontFamily: AppFonts.fontFamily,
    fontSize: 12,
    color: AppColors.neutral000,
  );
}
