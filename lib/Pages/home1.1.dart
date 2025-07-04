import 'dart:convert';

import 'package:demo_project_1/Models/models.dart';
import 'package:demo_project_1/widgets/cardview.dart';
import 'package:demo_project_1/widgets/recrodes_of_transcations.dart';
import 'package:demo_project_1/widgets/scrolable_cards.dart';
import 'package:flutter/material.dart';
import 'package:demo_project_1/Pages/add_money.dart';
import 'package:demo_project_1/Pages/profile_page.dart';
import 'package:http/http.dart' as http;

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
  bool loadingstate = true;
  var value = '';
  List<dynamic> transcations = [];
  void getdata() async{
    try{
      final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/transactions'),
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        setState(() {
          loadingstate = false;
          transcations = data;

        });
      }
      else{
        throw Exception("error");
      }
    }
    catch(e){
      print("object");
    }
  }
//dart basic learning
//bills
//-internship
//-Wifi bill
//income
//-kerseri bank

  @override
  void initState(){
    super.initState();
    getdata();
  }
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
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Icon(Icons.notifications_none_outlined),
                  ),
                  Positioned(
                    right: 2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 111, 111, 111),
                width: .3,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFF2F3F5),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning, Terry",
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "Welcome to Neobank",
              style: TextStyle(fontFamily: "SpaceGrotesk", fontSize: 17.5),
            ),
          ],
        ),
      ),
      
      body: ListView.separated(
             separatorBuilder: (context,index)=> Divider(),
              itemBuilder: (context,index){
                if(index == 0 ){
                  return Cardsview();
                }
                else{
                  
                  return 
                     Container(
                      decoration: BoxDecoration(
                        color: Colors.amber
                      ),
                      child: ListTile(
                        title: Text('${transcations['title']}'),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/starbucks.jpeg'),),
                          ),
                        ),
                        subtitle: Text('October 17,09:00 PM'),
                        trailing: Icon(Icons.abc_rounded),
                      ),
                    )
                  ;
                  
                }
              }, 
              
              
              itemCount: transcations.length+1),
          
        
      
      
      
    );
  }
}
class Cardsview extends StatelessWidget {
  const Cardsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
            Cardview(),
             Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: const Text(
                          "Your cards",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(Icons.add),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 27, 0),
                            child: const Text(
                              "New card",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 17,
                                fontFamily: 'SpaceGrotesk',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
            ScrolableCards(),
            
            
          ],
    );
  }
}