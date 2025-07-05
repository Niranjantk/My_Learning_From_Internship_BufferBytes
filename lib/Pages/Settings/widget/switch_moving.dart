import 'package:flutter/material.dart';
//switch 
class SwitchMoving extends StatefulWidget {
  const SwitchMoving({super.key});

  @override
  State<SwitchMoving> createState() => _SwitchMovingState();
}

class _SwitchMovingState extends State<SwitchMoving> {
  @override
  
  Widget build(BuildContext context) {
    bool light = true;
    return Container(
      child: Switch(value: light, onChanged: (bool newval){
            setState((){
              light = newval;
            });
          },),
    );
  }
}

