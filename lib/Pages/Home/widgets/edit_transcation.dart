// import 'package:flutter/material.dart';

// class EditTranscation extends StatefulWidget {
//   const EditTranscation({super.key});

//   @override
//   State<EditTranscation> createState() => _EditTranscationState();
// }

// class _EditTranscationState extends State<EditTranscation> {
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         Navigator.of(context).pop();
//         setState(() {});
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text('Edit Transaction'),
//               content: SizedBox(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Transaction Title',
//                       ),
//                       controller: titlecontrolder,
//                       autofocus: true,
//                     ),
//                     TextField(
//                       decoration: InputDecoration(labelText: 'Amount'),
//                       controller: amountcontrolder,
//                       keyboardType: TextInputType.number,
//                     ),
//                     TextField(
//                       decoration: InputDecoration(labelText: 'Cashback'),
//                       controller: cashbackcontrolder,
//                       keyboardType: TextInputType.number,
//                     ),
//                   ],
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () async {
//                     final id = transcation['id'];
//                     final title = titlecontrolder.text;
//                     final date = DateTime.now().toIso8601String();
//                     final amount =
//                         double.tryParse(amountcontrolder.text) ?? 0.0;
//                     final cashback =
//                         double.tryParse(cashbackcontrolder.text) ?? 0.0;
//                     PutTranscations putTranscations = PutTranscations();
//                     await putTranscations.putdata(
//                       id,
//                       title,
//                       date,
//                       amount,
//                       cashback,
//                     );
//                     getData(); // Refresh the data after editing
//                     titlecontrolder.clear();
//                     amountcontrolder.clear();
//                     cashbackcontrolder.clear();

//                     // Handle edit logic here
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('Save'),
//                 ),
//                 TextButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   child: Text('Cancel'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//       child: Text('Edit'),
//     );
//   }
// }
