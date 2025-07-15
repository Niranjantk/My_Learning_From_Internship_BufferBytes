import 'package:demo_project_1/Services/api_services.dart';
import 'package:flutter/material.dart';

class BalanceCounter extends ChangeNotifier {
  final AddMoneyTranscations addMoneyTranscations = AddMoneyTranscations();

  String balance = '';
  bool loadingState = true;

  String get getBalance => balance;
  bool get isLoading => loadingState;

  void fetchBalance() async {
    loadingState = true;
    notifyListeners();
    balance = await addMoneyTranscations.getData();
    loadingState = false;
    notifyListeners();
  }
}
