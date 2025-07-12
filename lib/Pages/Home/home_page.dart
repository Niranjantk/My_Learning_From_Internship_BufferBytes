import 'package:demo_project_1/Pages/Home/widgets/appBar_C.dart';
import 'package:demo_project_1/Pages/Home/widgets/heading.dart';
import 'package:demo_project_1/api/api_services.dart';
import 'package:flutter/material.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});
  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  final BalanceTranscations apiservese = BalanceTranscations();
  bool loadinSgstate = true;
  List<dynamic> transcations = [];
  TextEditingController titlecontrolder = TextEditingController();
  TextEditingController amountcontrolder = TextEditingController();
  TextEditingController cashbackcontrolder = TextEditingController();

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

  //==================================================================================
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F5),
      appBar: AppBar(
        toolbarHeight: 60,
        actions: [AppBarIcons()],
        backgroundColor: const Color(0xFFF2F3F5),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [AppBarText()],
        ),
      ),
      //==================================================================================
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Color(0xFFF2F3F5)),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Cardsview();
          } else {
            final transcation = transcations[index - 1];

            final formateddate = transcation['date'];
            DateTime date = DateTime.parse(formateddate);
            String day = date.day.toString().padLeft(2, '0');
            String month = date.month.toString().padLeft(2, '0');
            String year = date.year.toString().padLeft(4, '0');
            String hour = date.hour.toString().padLeft(2, '0');
            String minute = date.minute.toString().padLeft(2, '0');
            String datemonth = '$year - $month - $day  $hour : $minute';

            return InkWell(
              onTap: () {
                titlecontrolder.text = transcation['title'];
                amountcontrolder.text = transcation['amount'].toString();
                cashbackcontrolder.text = transcation['cashback'].toString();

                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text('Transaction Details'),
                        content: Column(
                          spacing: 10,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Transcation for  ${transcation['title']}'),
                            Text('Amount: \$${transcation['amount']}'),
                            Text('Cashback: \$${transcation['cashback']}'),
                            Text('Date: $datemonth and time: $hour:$minute'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {});
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Edit Transaction'),
                                    content: SizedBox(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Transaction Title',
                                            ),
                                            controller: titlecontrolder,
                                            autofocus: true,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Amount',
                                            ),
                                            controller: amountcontrolder,
                                            keyboardType: TextInputType.number,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Cashback',
                                            ),
                                            controller: cashbackcontrolder,
                                            keyboardType: TextInputType.number,
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          final id = transcation['id'];
                                          final title = titlecontrolder.text;
                                          final date =
                                              DateTime.now().toIso8601String();
                                          final amount =
                                              double.tryParse(
                                                amountcontrolder.text,
                                              ) ??
                                              0.0;
                                          final cashback =
                                              double.tryParse(
                                                cashbackcontrolder.text,
                                              ) ??
                                              0.0;
                                          PutTranscations putTranscations =
                                              PutTranscations();
                                          await putTranscations.putdata(
                                            id,
                                            title,
                                            date,
                                            amount,
                                            cashback,
                                          );
                                          getData(); // Refresh the data after editing
                                          titlecontrolder.clear();
                                          amountcontrolder.clear();
                                          cashbackcontrolder.clear();

                                          // Handle edit logic here
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Save'),
                                      ),
                                      TextButton(
                                        onPressed:
                                            () => Navigator.of(context).pop(),
                                        child: Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Edit'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Close'),
                          ),
                        ],
                      ),
                );
              },
              child: Container(
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
              ),
            );
          }
        },

        itemCount: transcations.length + 1,
      ),
    );
  }
}
