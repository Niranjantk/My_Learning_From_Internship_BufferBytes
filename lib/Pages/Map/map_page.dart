
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
    return MyHomepage();
  }
}
class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  //here
  @override
  Widget build(BuildContext context) {
    //here
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: Wrap(
          children: [
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
            Text('hello world'),
             
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      child: Icon(Icons.home),),
      
    );
  }
}