import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:news_app/components/DetailDivider.dart';
import 'package:news_app/components/DetailTime.dart';
import 'package:news_app/components/ReadMoreButton.dart';
import 'package:news_app/components/detail_title.dart';
import 'package:news_app/constants/api_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app/models/articl_model.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:news_app/theme/app_text_styles.dart';
import 'package:news_app/views/home_view.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actions: article.url != null
            ? [
                IconButton(
                  onPressed: () {
                    Share.share(article.url!);
                  },
                  icon: Icon(Icons.share),
                ),
              ]
            : null,
        leading: IconButton(
          icon: Icon(Icons.newspaper_outlined),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          },
        ),
        title: Text(
          article.title,
          overflow: TextOverflow.fade,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(13, 17, 13, 20),
        children: [
          DetailTitle(article: article),
          const DetailDivider(),
          DetailTime(article: article.publishedAt),
          const SizedBox(height: 10),
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? ApiConst.defaultImage,
            placeholder: (context, url) => Image.asset("assets/news_image.jpg"),
            errorWidget: (context, url, error) =>
                Image.asset("assets/error_photo.jpg"),
          ),
          const SizedBox(height: 10),
          Text(article.description ?? "",
              style: AppTextStyles.detailDescription),
          const SizedBox(height: 20),
          article.url != null
              ? ReadMoreButton(
                  onPressed: () async {
                    final uri = Uri.parse(article.url!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
