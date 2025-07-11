import 'package:demo_project_1/Pages/login_page/widget/screen_splash_login.dart';
import 'package:demo_project_1/api/api_services.dart';
import 'package:demo_project_1/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  runApp(MaterialApp(
    home: token == null ? ScreenSplashLogin() : HomeNavigationBar(),
  ));
}

//widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> isUserLoggedIn() async {
    final controller = AuthServices();
    final user = await controller.getSavedUser();
    return user != null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sample app',
      theme: ThemeData(useMaterial3: true),

      debugShowCheckedModeBanner: false,
      home: ScreenSplashLogin(),


    );
  }
}
