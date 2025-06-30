import 'package:flutter/material.dart';

class Cardview extends StatelessWidget {
  const Cardview({super.key});

  @override
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
            child: Text("Your balance", style: TextStyle(fontSize: 17,color: const Color.fromARGB(255, 89, 89, 89))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 40, 10),
                child: const Text(
                  "\$3,200.00",

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
