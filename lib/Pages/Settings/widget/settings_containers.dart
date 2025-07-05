import 'package:demo_project_1/Pages/Settings/widget/switch_moving.dart';
import 'package:flutter/material.dart';
//Allow transcations between accoounds access
class AllowTranscations extends StatelessWidget {
  
  const AllowTranscations({super.key});
  
  @override
  
  Widget build(BuildContext context) {
    
    return Container(
      width: 350,
      height: 60,
      
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(16),
        
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.lock_open_outlined),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Allow transactions"),
                const Text("Transcation are allowed"),
              ],
            ),
          ),
         
        SwitchMoving()
        ],
      ),
    );
  }
}

class Settingsotheroptions extends StatelessWidget {
  const Settingsotheroptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: 350,
        height: 60,
         decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
         ),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.remove_red_eye_outlined),
            const Text("View your pin"),
            const Icon(Icons.arrow_forward_ios)
          ],
         ),
      ),
    );
  }
}