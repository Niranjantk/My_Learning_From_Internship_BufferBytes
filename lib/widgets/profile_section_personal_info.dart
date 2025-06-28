import 'package:flutter/material.dart';
class ProfileSectionPersonalInfo extends StatelessWidget {
  const ProfileSectionPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 400,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(16)

      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                child: const Text("Personal info",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.bold

                ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 26, 10),
                child: const Text("Edit",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.bold
                ),),
              )
            ],
          ),
          Onecontainerofpersonaldetainls(),
          Onecontainerofpersonaldetainls(),
          Onecontainerofpersonaldetainls(),
          Onecontainerofpersonaldetainls(),
          Onecontainerofpersonaldetainls(),
          
        ],
      ),
    );
  }
}

class Onecontainerofpersonaldetainls extends StatelessWidget {
  const Onecontainerofpersonaldetainls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
            width: 330,
            height: 60,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.face_2_outlined,size: 40,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //name heading
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: const Text("Name",
                        style: TextStyle(
                          fontFamily: 'SpaceGrotesk',
                          fontSize: 14,
                        
                        ),),
                      ),
                      
                      //name
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: const Text('Terry Melton',
                        style: TextStyle(
                          fontFamily: 'SpaceGrotesk',
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),
                )

              ],
            ),
          
    );
  }
}



class Accountinfomation extends StatelessWidget {
  const Accountinfomation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 400,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(16)

      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                child: const Text("Personal info",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.bold

                ),),
              ),
             
            ],
          ),
          Onecontainerofpersonaldetainls(),
          Onecontainerofpersonaldetainls(),
          Onecontainerofpersonaldetainls(),
          Onecontainerofpersonaldetainls(),
          Onecontainerofpersonaldetainls(),
        ],
      ),
    );
  }
}