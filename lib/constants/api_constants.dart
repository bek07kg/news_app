class ApiConst {
  static const String apiKey = "a040d5c4c5b949548a8601a8ffc201e8";
  static String topNews([String? domain]) =>
      "http://newsapi.org/v2/top-headlines?country=${domain ?? "us"}&apiKey=$apiKey";
  static String searchNews(String? text) =>
      "https://newsapi.org/v2/everything?q=$text&apiKey=$apiKey";
  static const String defaultImage =
      "https://www.hessequa.gov.za/wp-content/uploads/2021/03/Marketplace-Lending-News.jpg";
}
