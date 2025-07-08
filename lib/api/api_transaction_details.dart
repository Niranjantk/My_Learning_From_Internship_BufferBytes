import 'package:http/http.dart' as http;
import 'dart:convert';

//TRANSCATIONS = "TITLE", "DATE & TIME" , "AMOUNT"

class BalanceTranscations {
  Future<List<dynamic>> getdata() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/transactions'),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load transactions");
      }
    } catch (e) {
      print("Error fetching transactions: $e");
      return [];
    }
  }
}

//ADDMONEY = "YOURBALANCE"
class AddMoneyTranscations {
  Future<String> getData() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/balance'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['amount'].toString();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error fetching data: $e");
      return '';
    }
  }
}

//ADD MONEY BUTTON TO ADD DATA
