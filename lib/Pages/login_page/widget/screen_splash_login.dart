import 'package:demo_project_1/Pages/login_page/screen_login_page_contents.dart';
import 'package:flutter/material.dart';

class ScreenSplashLogin extends StatefulWidget {
  const ScreenSplashLogin({super.key});

  @override
  State<ScreenSplashLogin> createState() => _ScreenSplashLoginState();
}

class _ScreenSplashLoginState extends State<ScreenSplashLogin> {
  @override
  void initState() {
    super.initState();
    gotologin(context);
  }

  Future<void> gotologin(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (contx) => LoginPageContents()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Box()],
        ),
      ),
    );
  }
}

//THE BOX =====================================================
class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      decoration: BoxDecoration(
        color: Color(0xFFC9F158),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ContentOfThebox()],
      ),
    );
  }
}

//THE CONTENT OF THE BOX =======================================
class ContentOfThebox extends StatelessWidget {
  const ContentOfThebox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(radius: 60, child: Icon(Icons.track_changes, size: 50)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.apps),
              Text(
                'Money Tracking App',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpaceGrotesk',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
