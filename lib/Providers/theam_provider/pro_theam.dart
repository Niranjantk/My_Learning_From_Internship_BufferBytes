import 'package:demo_project_1/theam/theam_data.dart';
import 'package:flutter/material.dart';

class ProTheam extends ChangeNotifier{
  ThemeData themeData = lightMode;

  ThemeData get theamdatas => themeData;


  set theamdatas (ThemeData themeData){
    theamdatas = themeData;
  }

  void choiceTheam (){
    if(themeData==lightMode){
      theamdatas = dartkMode;
    }else{
      theamdatas = lightMode;
    }
  }
}