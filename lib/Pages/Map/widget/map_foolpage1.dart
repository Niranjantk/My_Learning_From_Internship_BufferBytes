
import 'package:demo_project_1/Pages/Map/widget/map_foolpage1.dart';
import 'package:demo_project_1/widgets/navigation_bar.dart';
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
  //init, didchangedep, build, dispost
  @override
  void initState() { //once call 
    gotologin();
    super.initState();
    
  }
  @override
  void didChangeDependencies() { //while building 
    super.didChangeDependencies();
    
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Image.asset('assets/images/leaves.jpg'),
    );
    
  }
  //dispose - once to remove from the momory
  Future <void> gotologin ()async{
    Future.delayed(Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
      return HomeNavigationBar();
    }));
  }
}