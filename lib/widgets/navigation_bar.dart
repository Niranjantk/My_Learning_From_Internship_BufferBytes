
import 'package:demo_project_1/Pages/History/history_page.dart';
import 'package:demo_project_1/Pages/Home/home_page.dart';
import 'package:demo_project_1/Pages/Map/map_page.dart';
import 'package:demo_project_1/Pages/Profile/profile_page.dart';
import 'package:demo_project_1/Pages/Settings/settings_page.dart';
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
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined),label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.history_outlined),label: "History", ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.face_2_outlined), label: "Profile"),
        ],),
        
    );
  }
}