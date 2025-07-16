import 'package:demo_project_1/Pages/Home/widgets/appBar_C.dart';
import 'package:demo_project_1/Pages/Home/widgets/head_lines.dart';
import 'package:demo_project_1/Providers/home_provider/pro_transcations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        actions: [AppBarIcons()],
        backgroundColor: const Color(0xFFF2F3F5),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [AppBarText()],
        ),
      ),
      //
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [Cardsview(), Transcation()]),
      ),
    );
  }
}

//========================================================================================
class Transcation extends StatefulWidget {
  const Transcation({super.key});

  @override
  State<Transcation> createState() => _TranscationState();
}

class _TranscationState extends State<Transcation> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (
            context,
            ProTranscations proTranscations,
            child,
          ) => ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: proTranscations.getTrancation.length,
            itemBuilder: (context, index) {
              final transcation = proTranscations.getTrancation[index];
              final formateddate = transcation['date'];
              DateTime date = DateTime.parse(formateddate);
              String day = date.day.toString().padLeft(2, '0');
              String month = date.month.toString().padLeft(2, '0');
              String year = date.year.toString().padLeft(4, '0');
              String hour = date.hour.toString().padLeft(2, '0');
              String minute = date.minute.toString().padLeft(2, '0');
              String datemonth = '$year - $month - $day  $hour : $minute';
              return ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialogBox(index: index),
                  );
                },
                title: Text(
                  proTranscations.getTrancation[index]['title'],
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
                      '\$${proTranscations.getTrancation[index]['amount']}',
                      style: TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+\$${proTranscations.getTrancation[index]['cashback']}',
                      style: TextStyle(
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 14,
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
          ),
    );
  }
}

//=============================================================
class AlertDialogBox extends StatefulWidget {
  final int index;

  const AlertDialogBox({super.key, required this.index});

  @override
  State<AlertDialogBox> createState() => _AlertDialogBoxState();
}

class _AlertDialogBoxState extends State<AlertDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ProTranscations proTranscations, child) {
        final transcation = proTranscations.getTrancation[widget.index];
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("close"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) => EditTrancations(index: 0),
                );

              },
              child: Text("edit"),
            ),
          ],
          title: Text('Transcation Details'),
          content: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title : ${transcation['title']}"),
              Text("Amount : ${transcation['amount']}"),
              Text('Cashback : ${transcation['cashback']}'),
            ],
          ),
        );
      },
    );
  }
}

//============================================================================
class EditTrancations extends StatefulWidget {
  final int index;
  const EditTrancations({super.key, required this.index});

  @override
  State<EditTrancations> createState() => _EditTrancationsState();
}

class _EditTrancationsState extends State<EditTrancations> {
  TextEditingController titlecontrolder = TextEditingController();
  TextEditingController amountcontrolder = TextEditingController();
  TextEditingController cashbackcontrolder = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ProTranscations proTranscations, child) {
        final transcation = proTranscations.getTrancation[widget.index];
        titlecontrolder.text = transcation['title'];
        amountcontrolder.text = transcation['amount'].toString();
        cashbackcontrolder.text = transcation['cashback'].toString();
        return AlertDialog(
          title: Text("Edit Transaction"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },

              child: Text('Close'),
            ),
            TextButton(
              onPressed: () async {
                final id = transcation['id'];
                final title = titlecontrolder.text;
                final data = DateTime.now().toIso8601String();
                final amount = double.parse(amountcontrolder.text);
                final cashback = double.parse(cashbackcontrolder.text);
                await proTranscations.putdatatranscation(
                  id,
                  title,
                  data,
                  amount,
                  cashback,
                );
                proTranscations.getData();
                Navigator.of(context).pop();
              },
              child: Text('save'),
            ),
          ],
          content: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Transaction Title'),
                  controller: titlecontrolder,
                  //initialValue: transcation['title'],
                  autofocus: true,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountcontrolder,
                  //initialValue: transcation['amount'],
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Cashback'),
                  controller: cashbackcontrolder,
                  //initialValue: transcation['cashback'],
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
