import 'package:demo_project_1/Pages/Home/widgets/debit_Cards.dart';
import 'package:demo_project_1/Pages/Home/widgets/balanceShowAddExpence.dart';
import 'package:flutter/material.dart';

class Cardsview extends StatelessWidget {
  const Cardsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddMoneyButtonClick(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: const Text(
                "Your cards",

                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(Icons.add),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 27, 0),
                  child: const Text(
                    "New card",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      fontFamily: 'SpaceGrotesk',
                    ),
                  ),
                ),
              ],
            ),
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
            Text(
              "See all",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
