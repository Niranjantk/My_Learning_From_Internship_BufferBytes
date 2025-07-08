import 'package:flutter/material.dart';
//PROFILE CIRCLE=================================================
class ProfileCircle extends StatelessWidget {
  const ProfileCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFFC9F158),
      child: Icon(Icons.person, size: 70),
      radius: 80,
    );
  }
}

//LOGIN HEADING=================================================
class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              "Login",
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//THE INPUTS =================================================

//TEXT BETWEEN THE BUTTON AND THE INPUT =================================================
class Textbetweentheinputs extends StatelessWidget {
  const Textbetweentheinputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text("Forgot password Click here"),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

//THE SUBMIT BUTTON =================================================

//BUTTON OR OTHERS =================================================
class Buttonotheres extends StatelessWidget {
  const Buttonotheres({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Divider(thickness: 0.5, color: Colors.black)),
              Text('Or Continue with'),
              Expanded(child: Divider(thickness: 0.5, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
//OTHER WAY TO CONTINUE =================================================

class GoogleIcons extends StatelessWidget {
  const GoogleIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black, width: 0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(Icons.facebook, size: 40),
            SizedBox(width: 10),
            Icon(Icons.social_distance, size: 40),
          ],
        ),
      ),
    );
  }
}
