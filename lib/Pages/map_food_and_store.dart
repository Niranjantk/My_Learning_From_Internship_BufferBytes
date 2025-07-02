import 'package:flutter/material.dart';

class MapFoodAndStore extends StatelessWidget {
  const MapFoodAndStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView.builder(
       itemCount: 20,
      
       itemBuilder: (BuildContext context, int index) {
         return Text('data') ;
       },
     ),
    );
  }
}