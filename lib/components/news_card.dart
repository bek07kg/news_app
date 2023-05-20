import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/api_constants.dart';
import 'package:news_app/models/articl_model.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:news_app/theme/app_text_styles.dart';
import 'package:news_app/views/detail_view.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.news}) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailView(article: news),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? ApiConst.defaultImage,
                  placeholder: (context, url) =>
                      Image.asset("assets/news_image.jpg"),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/error_photo.jpg"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    news.title,
                    style: AppTextStyles.newsTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
