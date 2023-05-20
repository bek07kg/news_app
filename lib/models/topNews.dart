import 'package:news_app/models/articl_model.dart';

class TopNews {
  TopNews({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  final String status;
  final int totalResults;
  final List<Article> articles;

  factory TopNews.fromJson(Map<String, dynamic> json) {
    return TopNews(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.jsonArticle(x))));
  }
}
