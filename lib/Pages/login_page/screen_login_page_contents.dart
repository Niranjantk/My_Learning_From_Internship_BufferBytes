import 'package:demo_project_1/Pages/login_page/widget/components_of_login_page.dart';
import 'package:demo_project_1/api/api_services.dart';
import 'package:demo_project_1/models/models_json.dart';
import 'package:demo_project_1/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class LoginPageContents extends StatefulWidget {
  const LoginPageContents({super.key});

  @override
  State<LoginPageContents> createState() => _LoginPageContentsState();
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();
LoginModel loginmodel = LoginModel();

final loginkey = GlobalKey<FormState>();

class _LoginPageContentsState extends State<LoginPageContents> {
  void userothentication(BuildContext context) {}

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
                child: Form(
                  key: loginkey,
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid username';
                          }
                        },

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
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid password';
                          }
                        },
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

                onPressed: () async {
                  if (loginkey.currentState!.validate()) {
                    AuthServices _authServices = AuthServices();
                    final user = await _authServices.login(
                      usernameController.text,
                      passwordController.text,
                    );
                    if (user != null) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeNavigationBar(),
                        ),
                        (route) => false,
                      );
                    }
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
