import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle newsTextStyle = TextStyle(
    fontSize: 15,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle newsDetailStyle = TextStyle(
    fontSize: 20,
    color: AppColors.black,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle timeDate = TextStyle(
    fontSize: 17,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle detailDescription = TextStyle(
    fontSize: 17,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}
