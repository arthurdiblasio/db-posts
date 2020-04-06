import 'package:blog_arthur/pages/home.page.dart';
import 'package:blog_arthur/pages/splash.page.dart';
import 'package:blog_arthur/util/app_colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DB POSTS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Nunito'),
      home: SplashPage(),
    );
  }
}
