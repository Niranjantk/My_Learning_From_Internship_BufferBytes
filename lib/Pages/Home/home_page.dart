import 'package:demo_project_1/Pages/Home/widgets/cardview.dart';
import 'package:demo_project_1/Pages/Home/widgets/Your_cards_row.dart';
import 'package:demo_project_1/api/api_transaction_details.dart';
import 'package:flutter/material.dart';





class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  final BalanceTranscations apiservese = BalanceTranscations();
  bool loadinSgstate = true;
  List<dynamic> transcations =[];
  
  void getData() async {
    await Future.delayed(Duration(seconds: 2));
    final data = await apiservese.getdata();
    setState(() {
      loadinSgstate = false;
      transcations = data;
    });
  }



  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //background color
      backgroundColor: Color(0xFFF2F3F5),

      //APP BAR
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Icon(Icons.notifications_none_outlined),
                  ),
                  Positioned(
                    right: 2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 111, 111, 111),
                width: .3,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFF2F3F5),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning, Terry",
              style: TextStyle(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "Welcome to Neobank",
              style: TextStyle(fontFamily: "SpaceGrotesk", fontSize: 17.5),
            ),
          ],
        ),
      ),

      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Color(0xFFF2F3F5)),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Cardsview();
          } else {
            final transcation = transcations[index - 1];

            final formateddate = transcation['date'];
            DateTime date = DateTime.parse(formateddate);
            String day = date.day.toString().padLeft(2,'0');
            String  month = date.month.toString().padLeft(2,'0');
            String year = date.year.toString().padLeft(4,'0');
            String hour = date.hour.toString().padLeft(2,'0');
            String minute = date.minute.toString().padLeft(2,'0');
            String datemonth ='$year - $month - $day  $hour : $minute';

            return Container(
              decoration: BoxDecoration(),
              child: ListTile(
                title: Text(
                  '${transcation['title']}',
                  style: TextStyle(
                    fontFamily: 'SpaceGrotesk',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/starbucks.jpeg',
                      ),
                    ),
                  ),
                ),

                subtitle: Text(
                  datemonth,
                  style: TextStyle(
                    fontFamily: 'SpaceGrotesk',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Column(
                  children: [
                    Text(
                      '\$${transcation['amount']}',
                      style: TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+\$${transcation['cashback']}',
                      style: TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 14,
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },

        itemCount: transcations.length + 1,
      ),
    );
  }
}

class Cardsview extends StatelessWidget {
  const Cardsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Cardview(),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Transscation"), Text("See all")],
        ),
      ],
    );
  }
}
