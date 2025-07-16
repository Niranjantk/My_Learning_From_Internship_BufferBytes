import 'package:demo_project_1/Models/m_user_details.dart';
import 'package:demo_project_1/Services/api_services.dart';
import 'package:flutter/material.dart';

class ProTranscations extends ChangeNotifier {
  bool loadinSgstate = true;
  List<dynamic> transcations = [];

  bool get isLoading => loadinSgstate;
  List<dynamic> get getTrancation => transcations;

  final BalanceTranscations apiservese = BalanceTranscations();
  final BalanceTranscations api = BalanceTranscations();

  void getData() async {
    //await Future.delayed(Duration(seconds: 2));
    final data = await apiservese.getdata();
    loadinSgstate = false;
    notifyListeners();
    transcations = data;
    notifyListeners();
  }

   putdatatranscation(dynamic id , String title, String data,double amount , double cashback) async {
    PutTranscations putTranscations = PutTranscations();
    await putTranscations.putdata(id, title, data,amount, cashback);
  }
}

void date(dynamic formateddate) {
  DateTime date = DateTime.parse(formateddate);
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString().padLeft(4, '0');
  String hour = date.hour.toString().padLeft(2, '0');
  String minute = date.minute.toString().padLeft(2, '0');
  String datemonth = '$year - $month - $day  $hour : $minute';
}
