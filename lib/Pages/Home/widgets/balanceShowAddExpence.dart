import 'dart:convert';

import 'package:demo_project_1/api/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddMoneyButtonClick extends StatefulWidget {
  const AddMoneyButtonClick({super.key});
  @override
  State<AddMoneyButtonClick> createState() => _CardviewState();
}

class _CardviewState extends State<AddMoneyButtonClick> {
  final AddMoneyTranscations addMoneyTranscations = AddMoneyTranscations();
  final TextEditingController title = TextEditingController();
  final TextEditingController amount = TextEditingController();
  bool loadinSgstate = true;
  String balance = '';

  void getData() async {
    
    final data = await addMoneyTranscations.getData();
    setState(() {
      loadinSgstate = false;
      balance = data;
    });
  }

  void postdata() async {
    final String enteredTitle = title.text;
    final double enteredAmount = double.tryParse(amount.text.trim()) ?? 0.0;

    final String date = DateTime.now().toIso8601String();
    final String id =
        DateTime.now().millisecondsSinceEpoch.toString();
    final double cashback = enteredAmount * 0.10;

    final Map<String, dynamic> data = {
      'id': id,
      'title': enteredTitle,
      'date': date,
      'amount': enteredAmount,
      'cashback': cashback,
    };

    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/transactions'),
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Transaction added")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to add transaction")));
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Container(
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
                loadinSgstate
                    ? CircularProgressIndicator()
                    : Text(
                      "Your balance",
                      style: TextStyle(
                        fontSize: 17,
                        color: const Color.fromARGB(255, 89, 89, 89),
                      ),
                    ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 40, 10),

                child: Text(
                  balance,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
                child: const Icon(Icons.visibility_off_outlined),
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
                                  ScaffoldMessenger.of(context).showSnackBar(
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
    );
  }
}
