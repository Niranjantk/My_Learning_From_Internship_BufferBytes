import 'package:demo_project_1/Pages/Home/widgets/debit_Cards.dart';
import 'package:demo_project_1/Pages/Home/widgets/balanceShowAddExpence.dart';
import 'package:demo_project_1/Pages/Map/map_page.dart';
import 'package:flutter/material.dart';

class Cardsview extends StatelessWidget {
  const Cardsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddMoneyButtonClick(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

          ],
        ),
        ScrolableCards(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Transscation",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 50),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecordOfTrancations(),
                  ),
                );
              },
              child: Text(
                "See all",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            // Text(
            //   "See all",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            // ),
          ],
        ),
      ],
    );
  }
}
