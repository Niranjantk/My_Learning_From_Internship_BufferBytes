import 'package:demo_project_1/Pages/login_page/widget/screen_splash_login.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

//widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sample app',
      theme: ThemeData(useMaterial3: true),

      debugShowCheckedModeBanner: false,
      home: ScreenSplashLogin(),

      //MainHomeScreen
      //HomeNavigationBar
    );
  }
}
