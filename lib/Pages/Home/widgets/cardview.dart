import 'package:demo_project_1/api/api_transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Cardview extends StatefulWidget {
  const Cardview({super.key});
  @override
  State<Cardview> createState() => _CardviewState();
}

class _CardviewState extends State<Cardview> {
  final AddMoneyTranscations addMoneyTranscations = AddMoneyTranscations();
  bool loadinSgstate = true;
  String balance='';
  
  void getData() async {
    await Future.delayed(Duration(seconds: 2));
    final data = await addMoneyTranscations.getData();
    setState(() {
      loadinSgstate = false;
      balance = data;
    });
  }

void postdata() async {
  final response = await post(Uri.parse('http://10.0.2.2:3000/transactions'),body: {
    'title': 'hello',
    'amount':34,
    'cashback':34,
  });
  print(response.body);

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
                  elevation: 0
                ),
                onPressed: ()=>showDialog(
                  context: context,
                   builder: (context)=>AlertDialog(
                    title: Text('Add the Transcations'),
                    content: SizedBox(
                      
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              hint: Text("Title"),
                            ),
                          ),
                          TextField(
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
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Discarded the transcations')));
                        }, child: Text('Cancel')),
                        TextButton(
                        onPressed: (){
                          postdata(,);
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add the transcations")));
                        }, child: Text('Add')),
                        ElevatedButton(
                          onPressed: postdata, 
                          child: Text('data')),
                        
                    ],
                   )),
                child: Text('Add money',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'SpaceGrotesk'
                ),)),
               
            ],
            
          ),
           
        ],
      ),
    );
  }
}
