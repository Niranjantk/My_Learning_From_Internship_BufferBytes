import 'package:flutter/material.dart';

class MapFoodAndStore extends StatefulWidget {
  const MapFoodAndStore({super.key});
  
  @override
  State<MapFoodAndStore> createState() => _MapFoodAndStoreState();
}

class _MapFoodAndStoreState extends State<MapFoodAndStore> {
  String index = "hello world";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView.builder(
       itemCount: index.length,
      
       itemBuilder: (BuildContext context, int index) {
         return Text('data') ;
       },
     ),
    );
  }
}