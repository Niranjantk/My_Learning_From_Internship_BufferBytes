import 'package:demo_project_1/Pages/Settings/widget/settings_containers.dart';
import 'package:flutter/material.dart';

class SteeingPage extends StatelessWidget {
  const SteeingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Settings",
            style: TextStyle(
              fontFamily: "SpaceGrotesk",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(children: [AllowTranscations(), Settingsotheroptions()]),
      ),
    );
  }
}
