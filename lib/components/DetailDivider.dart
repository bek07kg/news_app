import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';

class DetailDivider extends StatelessWidget {
  const DetailDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.blackDetails,
      height: 40.5,
      thickness: 2.5,
    );
  }
}
