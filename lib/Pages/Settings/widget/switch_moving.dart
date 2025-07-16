import 'package:demo_project_1/Providers/theam_provider/pro_theam.dart';
import 'package:demo_project_1/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: ElevatedButton(
        onPressed: () {
          // Provider.of<ProTheam>(context, listen: false).choiceTheam();
        },
        child: Icon(Icons.dark_mode),
      ),
    );
  }
}
