import 'package:flutter/material.dart';

//====================================================================

class AppBarText extends StatelessWidget {
  const AppBarText({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Good Morning,Terry", style: styleText(23, 'bold')),
      subtitle: Text("Welcome to Neobank", style: styleText(17, "normal")),
    );
  }

  TextStyle styleText(int size, String bold) {
    return TextStyle(
      fontSize: size.toDouble(),
      fontWeight: bold == "bold" ? FontWeight.bold : FontWeight.normal,
      color: Colors.black,
      fontFamily: 'SpaceGrotesk',
    );
  }
}
//====================================================================

class AppBarIcons extends StatefulWidget {
  const AppBarIcons({super.key});

  @override
  State<AppBarIcons> createState() => _AppBarIconsState();
}

class _AppBarIconsState extends State<AppBarIcons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 20, 0),

      child: IconButton(
        onPressed: () {},
        icon: Badge(
          label: Text('1'),
          child: Icon(
            Icons.notifications_none_outlined,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 111, 111, 111),
          width: .4,
          style: BorderStyle.solid,
        ),
      ),
      width: 48,
      height: 50,
    );
  }
}
