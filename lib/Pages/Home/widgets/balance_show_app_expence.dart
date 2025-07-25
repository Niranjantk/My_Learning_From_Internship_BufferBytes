import 'dart:convert';

import 'package:demo_project_1/Providers/home_provider/pro_balance.dart';
import 'package:demo_project_1/Services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddMoneyButtonClick extends StatefulWidget {
  const AddMoneyButtonClick({super.key});
  @override
  State<AddMoneyButtonClick> createState() => _CardviewState();
}

class _CardviewState extends State<AddMoneyButtonClick> {
  final AddMoneyTranscations addMoneyTranscations = AddMoneyTranscations();
  final TextEditingController title = TextEditingController();
  final TextEditingController amount = TextEditingController();




  void postdata() async {
    final String enteredTitle = title.text;
    final double enteredAmount = double.tryParse(amount.text.trim()) ?? 0.0;

    final String date = DateTime.now().toIso8601String();
    final String id = DateTime.now().millisecondsSinceEpoch.toString();
    final double cashback = enteredAmount * 0.10;

    final Map<String, dynamic> data = {
      'id': id,
      'title': enteredTitle,
      'date': date,
      'amount': enteredAmount,
      'cashback': cashback,
    };

    final response = await http.post(
      Uri.parse('http://192.168.1.67:3000/transactions'),
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Transaction added")));
    } else {
      print(response.statusCode);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to add transaction")));
    }
  }

  @override
  void initState() {
    super.initState();



  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<BalanceCounter>(context,listen: false).fetchBalance();
  }

  @override
  void dispose() {
    super.dispose();
  }
  //didchange dependency
  //did pop next
  //small app
  //medical illing system
  //other basic


  bool passwordVisibility = false;
  Widget build(BuildContext context) {
    final userp= Provider.of<BalanceCounter>(context);
    final dataprovider  = Provider.of<BalanceCounter>(context);
    return  RefreshIndicator(
      onRefresh: dataprovider.fetchBalance,
      child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              width: 370,
              height: 190,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child:
                        userp.isLoading
                            ? CircularProgressIndicator()
                            : Text(
                              "Your balance",
                              style: TextStyle(
                                fontSize: 17,
                                color: const Color.fromARGB(255, 89, 89, 89)
                              ),
                            ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 40, 10),

                        child: Text(
                          !passwordVisibility ? userp.balance : '****',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisibility = !passwordVisibility;
                            });
                          },
                          icon: Icon(
                            passwordVisibility
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(340, 50),
                          elevation: 0,
                        ),
                        onPressed:
                            () => showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    title: Text('Add the Transcations'),
                                    content: SizedBox(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: title,
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              hint: Text("Title"),
                                            ),
                                          ),
                                          TextField(
                                            controller: amount,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hint: Text("Amound"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Discarded the transcations',
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text('Cancel'),
                                      ),

                                      ElevatedButton(
                                        onPressed: postdata,
                                        child: Text('Add'),
                                      ),
                                    ],
                                  ),
                            ),
                        child: Text(
                          'Add money',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'SpaceGrotesk',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );

  }
}
