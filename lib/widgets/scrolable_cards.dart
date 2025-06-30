

import 'package:flutter/material.dart';
class ScrolableCards extends StatelessWidget {
  const ScrolableCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //first
          Container(
            
            margin: EdgeInsets.fromLTRB(24, 25, 15, 30),
            width: 320,
            height: 200,
            
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(26),
               image: DecorationImage(image: AssetImage("assets/images/card22.jpeg"),
               fit: BoxFit.cover,),
               
            ),
            child: Imagesalign(),
            
            
          ),
          //secondc
          
          Container(
            margin: EdgeInsets.fromLTRB(0, 24, 15, 30),
            width: 320,
            height: 200,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              image: DecorationImage(image: AssetImage("assets/images/card2.jpeg"),
               fit: BoxFit.cover,),
            ),
            child: Imagesalign(),
          ),
          //third
          Container(
            margin: EdgeInsets.fromLTRB(0, 24, 15, 30),
           width: 320,
            height: 200,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              image: DecorationImage(image: AssetImage("assets/images/card3.jpeg"),
               fit: BoxFit.cover,),
            ),
            child: Imagesalign()
          ),
          //fourth
          Container(
            margin: EdgeInsets.fromLTRB(0, 24, 15, 30),
            width: 320,
            height: 200,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              image: DecorationImage(image: AssetImage("assets/images/card4.jpeg"),
               fit: BoxFit.cover,),
            ),
            child: Imagesalign()
          ),
        ],
      ),
    );
  }
}


class Imagesalign extends StatelessWidget {
  const Imagesalign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 0, 40),
                      child: Image(image: AssetImage('assets/images/symbols.png'),
                      
                      width: 40,
                      height: 40,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(190, 20, 0, 40),
                      child: Image(image: AssetImage('assets/images/redyellow.jpeg'),
                      
                      width: 40,
                      height: 40,),
                    ),
                  ],
                ),
                Row(
                  children: [
                     Padding(
                       padding: const EdgeInsets.fromLTRB(25, 35, 0, 0),
                       child: const Text("Debit Card \n ...343",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17
                       ),),
                     ),
                     

                      Padding(
                        
                        padding: const EdgeInsets.fromLTRB(85, 25, 0, 0),
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(17)
                          ),
                          
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.visibility_outlined),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 13),
                                    child: const Text('Details',
                                    style: TextStyle(
                                      fontFamily: "SpaceGrotesk",
                                      fontWeight: FontWeight.bold,
                                                                  
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                                             ),
                      
                  ],
                )
              ],
    );
  }
}