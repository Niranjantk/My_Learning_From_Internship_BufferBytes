import 'package:demo_project_1/Pages/Add_money.dart';
import 'package:demo_project_1/Pages/home1.1.dart';
import 'package:demo_project_1/Pages/map_food_and_store.dart';
import 'package:demo_project_1/Pages/profile_page.dart';
import 'package:demo_project_1/Pages/settings_page.dart';
import 'package:flutter/material.dart';
class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  //holds the current page index
  State<HomeNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<HomeNavigationBar> {
  
  int _currentindex = 0;
  
  //allof the page in the list
  final List<Widget> _pages=[
    Homepage1(),MapFoodAndStore(),MapPage(),SteeingPage(),ProfilePage()
    //MapFoodAndStore(),
    

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 100,
        //currentindex to hilight the tab 
        currentIndex: _currentindex,
        onTap: (index){
          setState((){_currentindex = index;});
        },
        selectedItemColor:const Color.fromARGB(255, 0, 0, 0) ,
        unselectedItemColor:Colors.grey ,
        items: [
          
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map),label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: "History", ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.face_2_outlined), label: "Profile"),
        ],),
        
    );
  }
}