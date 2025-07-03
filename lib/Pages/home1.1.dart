import 'dart:convert';

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
  int myindex = 10;
  Future<List<Map<String, dynamic>>> gettransdata() async {
    try {
      final res = await http.get(
        Uri.parse('http://10.0.2.2:3000/transactions'),
      );

      if (res.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(res.body);
        print(data);
        return List<Map<String, dynamic>>.from(data['transactions']);
      } else {
        throw Exception("Fail");
      }
    } catch (e) {
      print("Erron to fetch data");
      return [];
    }
  }

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
      // body: Column(
      //   children: [
      //     SingleChildScrollView(
      //       scrollDirection: Axis.vertical,
      //       child: Padding(
      //         padding: const EdgeInsets.all(0),
      //         child: Column(
      //           children: [
      //             Cardview(),
              
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  //       child: const Text(
                  //         "Your cards",
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 27,
                  //         ),
                  //       ),
                  //     ),
                  //     Row(
                  //       mainAxisSize: MainAxisSize.max,
                  //       children: [
                  //         const Icon(Icons.add),
                  //         Padding(
                  //           padding: const EdgeInsets.fromLTRB(0, 0, 27, 0),
                  //           child: const Text(
                  //             "New card",
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.w800,
                  //               fontSize: 17,
                  //               fontFamily: 'SpaceGrotesk',
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
      //             ScrolableCards(),
      //             ListView.builder(
                  
      //               physics: NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               itemCount: myindex,
      //               itemBuilder: (BuildContext context, int index) {
      //                 return Padding(
      //                   padding: const EdgeInsets.symmetric(
      //                     vertical: 8.0,
      //                     horizontal: 16.0,
      //                   ),
      //                   child: Card(
      //                     elevation: 2,
      //                     child: ListTile(
      //                       leading: Icon(Icons.credit_card),
      //                       title: Text('Card ${index + 1}'),
      //                       subtitle: Text('Card details here'),
      //                     ),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        
        child: Column(
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        child: Container(
                         wid,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
