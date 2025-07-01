//creating the class named Transcation
//create the constructure with this and required
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Transcation{
  int? id;
  String? title;
  String? date;
  int? amount;
  int? cashback;

  //constructure
  Transcation({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.cashback,
  });
  
}
class Balance{
  int? bamount;
  Balance({
    required this.bamount,
  });
}