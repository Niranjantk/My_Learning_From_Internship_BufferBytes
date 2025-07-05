import 'package:flutter/material.dart';
class AddmoneyPageAddmoneyOptrion extends StatelessWidget {
  const AddmoneyPageAddmoneyOptrion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            width: 360,
            height: 70,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 214, 214, 214),
              borderRadius: BorderRadius.circular(15)
          
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: const Icon(Icons.menu),
              ),
              const Text("Apple pay"),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
          ),
          
        ],
      ),

    );
  }
}