import 'package:demo_project_1/main.dart';
import 'package:flutter/material.dart';

class Sw extends StatefulWidget {
  const Sw({super.key});

  @override
  State<Sw> createState() => _SwState();
}

class _SwState extends State<Sw> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        value: light,
        activeThumbColor: Colors.deepPurpleAccent,
        onChanged: (bool value) {
          setState(() {
            light = value;
            if (light == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Light Mode Enabled"),
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Dark Mode Enabled"),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          });
        },
      ),
    );
  }
}
