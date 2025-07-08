import 'package:flutter/material.dart';

class SmallScrolableCards extends StatelessWidget {
  const SmallScrolableCards({super.key});

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
            width: 150,
            height: 150,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage("assets/images/card22.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Imagesalign(),
          ),

          //secondc
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 15, 30),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage("assets/images/card2.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Imagesalign(),
          ),
          //third
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 15, 30),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage("assets/images/card3.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Imagesalign(),
          ),
          //fourth
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 15, 30),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage("assets/images/card4.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Imagesalign(),
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
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 40),
              child: Image(
                image: AssetImage('assets/images/symbols.png'),

                width: 40,
                height: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 0, 40),
              child: Image(
                image: AssetImage('assets/images/symbols.png'),

                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: const Text(
                "Debit Card \n ...343",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            // Padding(

            //   padding: const EdgeInsets.only(left: 100),
            //   child: Container(
            //     width: 100,
            //     height: 50,
            //     decoration: BoxDecoration(
            //       color: const Color.fromARGB(255, 223, 223, 223),
            //       borderRadius: BorderRadius.circular(20)
            //     ),

            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 10),
            //         child: Row(
            //           children: [
            //             const Icon(Icons.visibility_outlined),
            //             const Text('Details',
            //             style: TextStyle(
            //               fontFamily: "SpaceGrotesk",
            //               fontWeight: FontWeight.bold,

            //             ),),
            //           ],
            //         ),
            //       ),
            //     ),
            //                        ),
          ],
        ),
      ],
    );
  }
}
