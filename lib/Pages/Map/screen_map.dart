import 'package:demo_project_1/Pages/Home/demo.dart';
import 'package:demo_project_1/Services/api_services.dart';
import 'package:flutter/material.dart';

class RecordOfTrancations extends StatefulWidget {
  const RecordOfTrancations({super.key});

  @override
  State<RecordOfTrancations> createState() => _RecordOfTrancationsState();
}

class _RecordOfTrancationsState extends State<RecordOfTrancations> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 209, 209),
        title: Center(
          child: const Text(
            "History",
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(children: [Transcation()]),
    );
  }
}
