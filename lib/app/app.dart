import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'World News',
      theme: ThemeData(),
      home: HomeView(),
    );
  }
}
