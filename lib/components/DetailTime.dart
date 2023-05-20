import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:news_app/theme/app_text_styles.dart';

class DetailTime extends StatelessWidget {
  const DetailTime({Key? key, required this.article}) : super(key: key);

  final String article;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat(" d MMM, y.H:m").format(DateTime.parse(article));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.access_time,
          color: AppColors.blackDetails,
          size: 30,
        ),
        Text(
          time,
          style: AppTextStyles.timeDate,
        ),
      ],
    );
  }
}
