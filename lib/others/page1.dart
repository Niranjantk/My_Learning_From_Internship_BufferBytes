import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.person), Text('data')],
            ),
            SizedBox(width: 300, child: Divider()),
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("settings"),
                      leading: Icon(Icons.settings),
                      trailing: Icon(Icons.arrow_back_ios),
                    );
                  },
                ),
              ],
            ),
            SizedBox(width: 300, child: Divider()),
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("settings"),
                      leading: Icon(Icons.settings),
                      trailing: Icon(Icons.arrow_back_ios),
                    );
                  },
                ),
              ],
            ),
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(color: Colors.amber),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.mark_email_unread)),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined)),
        ],
      ),
    );
  }
}
