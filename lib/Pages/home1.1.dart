import 'package:demo_project_1/widgets/cardview.dart';
import 'package:demo_project_1/widgets/recrodes_of_transcations.dart';
import 'package:demo_project_1/widgets/scrolable_cards.dart';
import 'package:flutter/material.dart';
import 'package:demo_project_1/Pages/add_money.dart';
import 'package:demo_project_1/Pages/profile_page.dart';

//[]image set
//[] image round
//[]to make static
//

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  int myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background color
      backgroundColor: Color(0xFFF2F3F5),

      //APP BAR
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_none_outlined),
            ),
            width: 45,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)
            ),
          ),
        ],
        backgroundColor: const Color(0xFFF2F3F5),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good morning, Terry",
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.w900
            ),),
            const Text("Welcome to Neobank",
            style: TextStyle(
              fontFamily: "SpaceGrotesk",
              fontSize: 15,
            ),),
            
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          
          children: [
            Cardview(),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: const Text("Your cards",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(Icons.add),
                    const Text("New card",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ],
              
            ),
          ScrolableCards(),
           RecrodesOfTranscations(),
           ElevatedButton(onPressed: (){ 
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MapPage(),),);
           }, child: const Text("to the Map page")),
           ElevatedButton(onPressed: (){ 
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(),),);
           }, child: const Text("to the Map page"))
          ],
        
        ),
      
      ),
      
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: myindex,
      //   onTap: (index) {
      //     setState(() {
      //       myindex = index;
      //     });
        
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   items: [
          
      //     BottomNavigationBarItem(icon: Icon(Icons.home),
      //      label: "Home",
           
      //      ),
      //     BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
      //     BottomNavigationBarItem(icon: Icon(Icons.transfer_within_a_station_outlined),label: "Transfer", ),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings",),
      //     BottomNavigationBarItem(icon: Icon(Icons.face_2_outlined), label: "Profile"),
      //   ],
      
      // ),
    );
  }
}
