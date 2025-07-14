import 'package:demo_project_1/Pages/History/widgets/small_scroble_cards.dart';

import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F5),
      appBar: AppBar(
        //leading: Text("data"),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: const Text(
              "Add Money ",

              style: TextStyle(
                fontFamily: "SpaceGrotesk",
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),

        backgroundColor: const Color(0xFFF2F3F5),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 200),
              child: const Text(
                "Selece card",
                style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Container(child:
          SmallScrolableCards(),




        ],

      ),
    );
  }
}
