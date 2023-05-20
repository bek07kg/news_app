import 'package:flutter/material.dart';
import 'package:news_app/constants/text_constants.dart';
import 'package:news_app/theme/app_colors.dart';

class ReadMoreButton extends StatelessWidget {
  const ReadMoreButton({Key? key, required this.onPressed}) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
      ),
      child: Text(AppText.readMore),
    );
  }
}
