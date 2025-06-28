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
            
            margin: EdgeInsets.fromLTRB(25, 10, 15, 30),
            width: 310,
            height: 190,
            
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(30),
               image: DecorationImage(image: AssetImage("assets/images/leaves.jpg"),
               fit: BoxFit.cover,),
               
            ),
            child: Imagesalign(),
            
            
          ),
          //secondc
          
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 15, 30),
            width: 310,
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black,
            ),
            child: Imagesalign(),
          ),
          //third
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 15, 30),
            width: 310,
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.yellowAccent
            ),
            child: Imagesalign()
          ),
          //fourth
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 15, 30),
            width: 310,
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
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
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Image(image: AssetImage('assets/images/symbols.png'),
                      
                      width: 60,
                      height: 50,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(170, 10, 0, 70),
                      child: Image(image: AssetImage('assets/images/symbols.png'),
                      
                      width: 60,
                      height: 50,),
                    ),
                  ],
                ),
                Row(
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: const Text("Debit Card \n ...343",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                       ),),
                     ),
                     

                      Padding(
                        
                        padding: const EdgeInsets.only(left: 100),
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 223, 223, 223),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  const Icon(Icons.visibility_outlined),
                                  const Text('Details',
                                  style: TextStyle(
                                    fontFamily: "SpaceGrotesk",
                                    fontWeight: FontWeight.bold,
                              
                                  ),),
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