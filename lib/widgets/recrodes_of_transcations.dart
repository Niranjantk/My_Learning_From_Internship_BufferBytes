import 'package:flutter/material.dart';

class RecrodesOfTranscations extends StatelessWidget {
  const RecrodesOfTranscations({super.key});

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

class Recordescontent extends StatelessWidget {
  const Recordescontent({super.key});

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
                      child: const Text(
                        "Star bug coffee",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
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
