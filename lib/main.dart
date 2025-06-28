
import 'package:demo_project_1/Pages/home1.1.dart';

import 'package:flutter/material.dart';
//C:\Users\niran\OneDrive\Desktop\demo_app\demo_project_1\lib\navigation_bar.dart
void main(){
  runApp(const MyApp());
}

//widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBar(),
    );
  }
}