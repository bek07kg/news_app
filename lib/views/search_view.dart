import 'package:flutter/material.dart';
import 'package:news_app/components/news_card.dart';
import 'package:news_app/constants/text_constants.dart';
import 'package:news_app/models/topNews.dart';
import 'package:news_app/service/fetch_service.dart';
import 'package:news_app/theme/app_colors.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TopNews? topNews;
  bool isSearch = false;
  Future<void> fetchDate(String text) async {
    isSearch = true;
    setState(() {});
    topNews = await NewsPero().fetchSearchNews(text);
    isSearch = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.clear),
                  ),
                  hintText: "Search...",
                  border: InputBorder.none),
              onSubmitted: (value) async {
                await fetchDate(value);
              },
            ),
          ),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (isSearch) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (isSearch == false && topNews != null) {
      return ListView.builder(
        itemCount: topNews!.articles.length,
        itemBuilder: (BuildContext context, int index) {
          final news = topNews!.articles[index];
          return NewsCard(news: news);
        },
      );
    } else {
      return const Center(
        child: Text(AppText.pleaseSearch),
      );
    }
  }
}
