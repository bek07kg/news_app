import 'package:flutter/material.dart';
import 'package:news_app/models/articl_model.dart';
import 'package:news_app/theme/app_text_styles.dart';

class DetailTitle extends StatelessWidget {
  const DetailTitle({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Text(
      article.title,
      textAlign: TextAlign.center,
      style: AppTextStyles.newsDetailStyle,
    );
  }
}
