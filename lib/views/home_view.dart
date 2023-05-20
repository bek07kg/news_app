import 'package:flutter/material.dart';
import 'package:news_app/components/news_card.dart';
import 'package:news_app/constants/text_constants.dart';
import 'package:news_app/models/country_model.dart';
import 'package:news_app/models/topNews.dart';
import 'package:news_app/service/fetch_service.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:news_app/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TopNews? topNews;
  Future<void> fetchNews([String? domain]) async {
    topNews = null;
    setState(() {});
    topNews = await NewsPero().fetchTopNews(domain);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  var selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        leading: const Icon(Icons.newspaper_outlined),
        title: const Text(AppText.topNewsAppBarTitle),
        actions: [
          PopupMenuButton<Country>(
            onSelected: (Country item) async {
              await fetchNews(item.domain);
            },
            itemBuilder: (BuildContext context) {
              return countries
                  .map(
                    (e) => PopupMenuItem<Country>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: topNews == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: topNews!.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final news = topNews!.articles[index];
                return NewsCard(news: news);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchView(),
            ),
          );
        },
        child: Icon(
          Icons.search,
          color: AppColors.blue,
        ),
      ),
    );
  }
}
