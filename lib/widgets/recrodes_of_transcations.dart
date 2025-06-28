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
            borderRadius: BorderRadius.circular(30)
          ),
          child: Column(
            children: [
            //first
            //Container(),
           Padding(
             padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text("Transcation",
                 style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.bold
                 ),),
                 const Text("Seeall",
                 style: TextStyle(
                  fontSize: 18,
                  fontFamily:'SpaceGrotesk' ,
                  fontWeight: FontWeight.bold
                 ),),
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
        borderRadius: BorderRadius.circular(30),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              
              Container(
                
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/symbols.png")),
                  shape: BoxShape.circle,
                  
                ),
                
              ),
              Container(
                
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Star bug coffee",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                    ),),
                    
                       const Text("Ocober 17, 09:00"),
                    
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    const Text("-\$12.45",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    const Text('+\$3.67',
                    style: TextStyle(
                      backgroundColor: Color.fromARGB(255, 112, 255, 136),
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              )
             ],
          ),
        ),
      ),
    );
  }
}