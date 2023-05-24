class ApiConst {
  static const String apiKey = "5b245bdd269b4324a88ce005cbfcd32e";
  static String topNews([String? domain]) =>
      "http://newsapi.org/v2/top-headlines?country=${domain ?? "us"}&apiKey=$apiKey";
  static String searchNews(String? text) =>
      "https://newsapi.org/v2/everything?q=$text&apiKey=$apiKey";
  static const String defaultImage =
      "https://www.hessequa.gov.za/wp-content/uploads/2021/03/Marketplace-Lending-News.jpg";
}
