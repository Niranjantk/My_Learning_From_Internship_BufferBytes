import 'package:demo_project_1/Pages/Login/widget/screen_splash_login.dart';
import 'package:demo_project_1/Providers/home_provider/pro_balance.dart';
import 'package:demo_project_1/Providers/home_provider/pro_transcations.dart';
import 'package:demo_project_1/Providers/theam_provider/pro_theam.dart';
import 'package:demo_project_1/Services/api_services.dart';
import 'package:demo_project_1/Navigation/navigation_bar.dart';
import 'package:demo_project_1/theam/theam_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProTranscations()..getData(),
        ),
        ChangeNotifierProvider(
          create: (context) => BalanceCounter()..fetchBalance(),
        ),
        ChangeNotifierProvider(create: (contexts) => ProTheam()),
      ],

      child: Builder(
        builder: (context) {
          return MaterialApp(
            //theme: Provider.of<ProTheam>(contexts).theamdatas,
            //theme: lightMode,
            //theme: Provider.of<ProTheam>(context).theamdatas,
            home: token == null ? ScreenSplashLogin() : HomeNavigationBar(),
          );
        }
      ),
    ),
  );
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
