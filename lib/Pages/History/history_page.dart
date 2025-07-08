
//import 'package:demo_project_1/Pages/History/elements/addmoney_page_addmoney_optrion.dart';
//import 'package:demo_project_1/Pages/History/elements/small_scroble_cards.dart';
import 'package:demo_project_1/Pages/History/widgets/addmoney_page_addmoney_optrion.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
            Container(child: SmallScrolableCards()),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 70, 20),
              child: const Text(
                "Add Money to Neobank",
                style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 400,
              //height: 700,


                child: Column(
                  children: [
                    AddmoneyPageAddmoneyOptrion(),
                    AddmoneyPageAddmoneyOptrion(),
                    AddmoneyPageAddmoneyOptrion(),
                    AddmoneyPageAddmoneyOptrion(),
                    AddmoneyPageAddmoneyOptrion(),
                    AddmoneyPageAddmoneyOptrion(),
                    AddmoneyPageAddmoneyOptrion(),
                    AddmoneyPageAddmoneyOptrion(),
                    AddmoneyPageAddmoneyOptrion(),
                  ],
                ),

            ),
          ],
        ),
      ),
    );
  }
}
