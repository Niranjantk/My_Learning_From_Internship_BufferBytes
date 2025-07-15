import 'package:demo_project_1/Pages/Login/screen_login_page_contents.dart';
import 'package:demo_project_1/Services/api_services.dart';
import 'package:demo_project_1/Models/models_json.dart';
import 'package:flutter/material.dart';

class ProfileSectionPersonalInfo extends StatefulWidget {
  //final String accessToken;
  const ProfileSectionPersonalInfo({super.key});

  @override
  State<ProfileSectionPersonalInfo> createState() =>
      _ProfileSectionPersonalInfoState();
}

class _ProfileSectionPersonalInfoState
    extends State<ProfileSectionPersonalInfo> {
  late Future<LoginModel?> userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,

      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                child: const Text(
                  "Personal info",
                  style: TextStyle(
                    fontSize: 20,

                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 26, 10),
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          PersonInfo(user: loginmodel),
        ],
      ),
    );
  }
}

class PersonInfo extends StatefulWidget {
  final LoginModel user;
  const PersonInfo({super.key, required this.user});

  @override
  State<PersonInfo> createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
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
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${user!.firstName}${user!.lastName}", 
              style: TextStyle(fontSize: 28, fontFamily: ''),
            ),
            Text(
              "${user!.email}",
              style: TextStyle(fontSize: 20, fontFamily: ''),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    user!.gender!.toLowerCase() == 'male'
                        ? Icons.mail
                        : Icons.female,
                  ),
                  Text("${user!.gender}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
