import 'package:demo_project_1/Pages/Profile/widget/profile_section_personal_info.dart';
import 'package:demo_project_1/Pages/login_page/screen_login_page_contents.dart';
import 'package:demo_project_1/api/api_services.dart';

import 'package:demo_project_1/models/models_json.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  LoginModel currentUserinfo = LoginModel();
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  LoginModel? user;
  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    final fetchedUser = await AuthServices().fetchUserProfile();
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            ElevatedButton(onPressed: () {}, child: Text('Retry')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AuthServices().logout();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageContents()),
                  (route) => false,
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 209, 209),
        title: Center(
          child: const Text(
            "Profile",
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 142, 142, 142),
                  image: DecorationImage(image: NetworkImage('${user!.image}')),
                  border: Border.all(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    width: 5,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(150, 150, 0, 0),
                  child: Container(
                    child: const Icon(Icons.edit),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            ProfileSectionPersonalInfo(),
            Padding(
              padding: const EdgeInsets.only(top: 250, left: 250),
              child: SizedBox(
                width: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    AuthServices().logout();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPageContents(),
                      ),
                      (route) => false,
                    );
                  },
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.logout), Text("Logout")],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
