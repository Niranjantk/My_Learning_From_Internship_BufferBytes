import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 209, 209),
        title: Center(
          child: const Text(
            "Notifications",
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(child: Text("No notifications yet!")),
    );
  }
}
