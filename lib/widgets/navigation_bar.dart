import 'package:demo_project_1/Pages/Add_money.dart';
import 'package:demo_project_1/Pages/home1.1.dart';
import 'package:demo_project_1/Pages/profile_page.dart';
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
    Homepage1(),
    ProfilePage(),
    MapPage(),
    

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        //currentindex to hilight the tab 
        currentIndex: _currentindex,
        onTap: (index){
          setState((){_currentindex = index;});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history),label: "History", ),
          
          BottomNavigationBarItem(icon: Icon(Icons.face_2_outlined), label: "Profile"),
        ],),
        
    );
  }
}