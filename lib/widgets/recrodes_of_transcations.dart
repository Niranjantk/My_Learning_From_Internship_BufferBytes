import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecrodesOfTranscations extends StatefulWidget {
  const RecrodesOfTranscations({super.key});

  @override
  State<RecrodesOfTranscations> createState() => _RecrodesOfTranscationsState();
}

class _RecrodesOfTranscationsState extends State<RecrodesOfTranscations> {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
        width: 370,
        //height: 450,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            //first
            //Container(),
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 26, 18, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Transcation",
                    style: TextStyle(
                      fontSize: 26,
                      //fontFamily: 'SpaceGrotesk',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18,
                        //fontFamily:'SpaceGrotesk' ,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Recordescontent(),
            //second
            Recordescontent(),
            //third
            Recordescontent(),
            //fourth
            Recordescontent(),
            //fifth
            Recordescontent(),
            //sisth
            Recordescontent(),

            //seventh
          ],
        ),
      ),
    );
  }
}

class Recordescontent extends StatefulWidget {
  const Recordescontent({super.key});

  @override
  State<Recordescontent> createState() => _RecordescontentState();
}

class _RecordescontentState extends State<Recordescontent> {
  Future <Map<String,dynamic>> gettransdata() async{
    try{
      final res = await http.get(Uri.parse('http://10.0.2.2:3000/transactions'));

      if(res.statusCode == 200  ){
        final data = jsonDecode(res.body);
        print(data);
        return data;
      
      }
      else{
        throw Exception("Fail");
      }
      
    }
    catch(e){
      print("Erron to fetch data");
      return {};
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 70,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(0),
        
      ),
      
        //scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Row(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  color: const Color.fromARGB(0, 255, 255, 255),
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/starbucks.jpeg"),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              Container(
                
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: .5))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 40, 7),
                      child: FutureBuilder(
                        future: gettransdata(),
                        builder: (context, snap) {
                          if(snap.hasData){
                            return  Text((snap.data as Map)["title"],
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          );
                          }
                          else{
                            return CircularProgressIndicator();
                          }
                          
                        }
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 40, 0),
                      child: const Text("Ocober 17, 09:00",style: TextStyle(
                        fontSize: 17
                      ),),
                    ),
                  ],
                ),
              ),
             
                 Container(
                  
                  decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: .5))
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "-\$12.45",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      Container(
                        width: 63,
                        height: 26,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: const Text(
                            '+\$3.67',
                            style: TextStyle(
                             // backgroundColor: Color.fromARGB(255, 112, 255, 136),
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              
            ],
          ),
        ),
      
    );
  }
}


//looping the container
//loading bar before the data load
//figma design of medical store bill system
//create a app from youtube
//github
//Leetcode
//portfolio
//Resume
//linkedin
//monkeytype
//
