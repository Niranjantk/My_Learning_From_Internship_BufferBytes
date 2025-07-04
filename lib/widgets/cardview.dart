import 'dart:convert';


import 'package:flutter/material.dart';
//import http
import 'package:http/http.dart' as http;

class Cardview extends StatefulWidget {
  const Cardview({super.key});

  @override
  State<Cardview> createState() => _CardviewState();
}

class _CardviewState extends State<Cardview> {
  // Future <Map<String,dynamic>> getData() async{
  //   final response = await http.get(Uri.parse('http://10.0.2.2:3000/balance'));
  //   return jsonDecode(response.body)['balance'];
  // }
  //login state and value
  bool loadinSgstate = true;
  var value  = "";
  void getData() async {
    try {
      await Future.delayed(Duration(seconds: 5));
        final response = await http.get(
          Uri.parse('http://10.0.2.2:3000/balance'),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          
          loadinSgstate = false;
          value = data['amount'].toString();
        });
        
      } else {
        throw Exception('Failed to load data'); 
      }
    } catch (e) {
      print("Error fetching data: $e");
      
      
      // return {};
    }
  }

  @override
  //only call once
  //initilize data
  //flutter app cycle
  void initState(){
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: 370,
      height: 190,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child:loadinSgstate
            
            ?CircularProgressIndicator():
             Text(
              "Your balance",
              style: TextStyle(
                fontSize: 17,
                color: const Color.fromARGB(255, 89, 89, 89),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 40, 10),
                
                child:  Text("$value",
                  style: TextStyle(
                    //fontFamily: "SpaceGrotesk",
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
                child: const Icon(Icons.visibility_off_outlined),
              ),
            ],
          ),
          Center(
            child: Container(
              child: Center(
                child: Text(
                  "Add money",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SpaceGrotesk',
                    color: Colors.white,
                  ),
                ),
              ),
              height: 50,
              width: 330,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
