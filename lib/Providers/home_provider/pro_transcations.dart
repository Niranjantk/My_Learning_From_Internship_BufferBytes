import 'package:demo_project_1/Services/api_services.dart';
import 'package:flutter/material.dart';
class ProTranscations extends ChangeNotifier {
  bool loadinSgstate = true;
  List<dynamic> transcations = [];

  bool get isLoading => loadinSgstate;
  List <dynamic> get getTrancation => transcations;

   final BalanceTranscations apiservese = BalanceTranscations();
   final BalanceTranscations api = BalanceTranscations();

     void getData() async {
    //await Future.delayed(Duration(seconds: 2));
    final data = await apiservese.getdata();
      loadinSgstate = false;
      notifyListeners();
      transcations = data;


  }
}