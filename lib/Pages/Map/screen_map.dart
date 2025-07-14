import 'package:demo_project_1/Services/api_services.dart';
import 'package:flutter/material.dart';

class RecordOfTrancations extends StatefulWidget {
  const RecordOfTrancations({super.key});

  @override
  State<RecordOfTrancations> createState() => _RecordOfTrancationsState();
}

class _RecordOfTrancationsState extends State<RecordOfTrancations> {
  final BalanceTranscations apiservese = BalanceTranscations();
  List<dynamic> transcations = [];
  bool loadinSgstate = true;
  void getData() async {
    // await Future.delayed(Duration(seconds: 2));
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
      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 209, 209),
        title: Center(
          child: const Text(
            "History",
            style: TextStyle(
              fontFamily: 'SpaceGrotesk',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: transcations.length,
        separatorBuilder:
            (context, index) => Divider(color: Color.fromARGB(255, 0, 0, 0)),
        itemBuilder: (context, index) {
          final transcation = transcations[index];
          final formateddate = transcation['date'];
          DateTime date = DateTime.parse(formateddate);
          String day = date.day.toString().padLeft(2, '0');
          String month = date.month.toString().padLeft(2, '0');
          String year = date.year.toString().padLeft(4, '0');
          String hour = date.hour.toString().padLeft(2, '0');
          String minute = date.minute.toString().padLeft(2, '0');
          String datemonth = '$year - $month - $day  $hour : $minute';
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
                    backgroundImage: AssetImage('assets/images/starbucks.jpeg'),
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
        },
      ),
    );
  }
}
