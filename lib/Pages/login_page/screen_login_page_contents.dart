import 'dart:convert';

import 'package:demo_project_1/Pages/login_page/widget/components_of_login_page.dart';
import 'package:demo_project_1/models/authentication_models.dart';
import 'package:demo_project_1/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginPageContents extends StatefulWidget {
  const LoginPageContents({super.key});

  @override
  State<LoginPageContents> createState() => _LoginPageContentsState();
}
final usernameController = TextEditingController();
    final passwordController = TextEditingController();

class _LoginPageContentsState extends State<LoginPageContents> {
  void userothentication(BuildContext context) {


    Future<Post?> loginUser({
  required String username,
  required String password,
}) async {
  final response = await http.post(
    Uri.parse('https://dummyjson.com/auth/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'username': username,
      'password': password,
      'expiresInMins': 30,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return Post.fromJson(data);
  } else {
    throw Exception('Login failed: ${response.body}');
  }
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140),
            ProfileCircle(),
            Heading(),
            //=============================================================
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hint: Text('User name'),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 4),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hint: Text('Password'),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 4),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            //==================================================================================
            Textbetweentheinputs(),
            //=========================================================================
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC9F158),
                  foregroundColor: Colors.black,
                  elevation: 10,
                ),

                onPressed: () async{
                  try {
      final user = await loginUser(
        username: usernameController.text,
        password: passwordController.text,
      );

      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeNavigationBar()),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SpaceGrotesk',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            //=========================================================================
            Buttonotheres(),
            GoogleIcons(),
          ],
        ),
      ),
    );
  }
}
