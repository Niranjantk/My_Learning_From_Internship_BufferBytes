import 'package:demo_project_1/Models/m_user_details.dart';
import 'package:demo_project_1/Services/api_services.dart';
import 'package:flutter/material.dart';

class ProProfile extends ChangeNotifier {
  LoginModel? user;

  Future<void> loadUserProfile() async {
    final fetchuser = await AuthServices().fetchUserProfile();
    user = fetchuser;
    notifyListeners();
  }
}
