import 'package:demo_project_1/Pages/Profile/widget/profile_section_personal_info.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      title: Center(child: const Text("Profile",
      style:TextStyle(
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.bold,
      ),)),
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
                  border: Border.all(color: const Color.fromARGB(255, 224, 224, 224),width: 5,style: BorderStyle.solid,)
                ),
                child:Padding(
                  padding: const EdgeInsets.fromLTRB(150, 150, 0, 0),
                  child: Container(child: const Icon(Icons.edit),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255)
                  ),),
                ),
              ),
            ),
            ProfileSectionPersonalInfo(),
            Accountinfomation(),
          ],
        ),
      ),
    );
  }
}