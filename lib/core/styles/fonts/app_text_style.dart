import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_app/core/styles/colors/app_colors_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle font16BlackW500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.inter().fontFamily,
    color: AppColorsManager.blackColor,
  );
}