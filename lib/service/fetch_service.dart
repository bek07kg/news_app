import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/api_constants.dart';

import 'package:news_app/models/topNews.dart';

class NewsPero {
  final http.Client client = http.Client();

  Future<TopNews?> fetchTopNews([String? domain]) async {
    final Uri uri = Uri.parse(ApiConst.topNews(domain));
    final http.Response response = await client.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final topNews = TopNews.fromJson(data);
      return topNews;
    } else {
      return null;
    }
  }

  Future<TopNews?> fetchSearchNews(String? text) async {
    final Uri uri = Uri.parse(ApiConst.searchNews(text));
    final http.Response response = await client.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);

      final topNews = TopNews.fromJson(data);

      return topNews;
    } else {
      return null;
    }
  }
}
