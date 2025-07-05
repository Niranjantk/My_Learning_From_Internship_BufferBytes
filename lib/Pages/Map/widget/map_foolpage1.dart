
import 'package:flutter/material.dart';
class Screen1page extends StatelessWidget {
  final String name;
  const Screen1page({Key? key,required this.name}):super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text("Screen 1"),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Go Back"))
            ],
          ),
        ),
        
      ),
    );
  }
}