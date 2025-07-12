import 'package:demo_project_1/models/models_json.dart';
import 'package:demo_project_1/service/api_urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//GET TRANSACTION DETAILS

class BalanceTranscations {
  Future<List<dynamic>> getdata() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.67:3000/transactions'),
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

//PUT TRANSACTION DETAILS
class PutTranscations {
  Future<void> putdata(String id, String title,String date, double amount, double cashback) async {
    try {
      final response = await http.put(
        Uri.parse('http://192.168.1.67:3000/transactions/$id'),
        headers: {'Content-Type': 'application/json'},

        body: jsonEncode(<String, dynamic>{
          'title': title,
          'amount': amount,
          'cashback': cashback,
          'date': date,
        }),
      );
      if (response.statusCode != 200) {
        throw Exception("Failed to update transaction");
      }
    } catch (e) {
      print("Error updating transaction: $e");
    }
  }
}

//GET BALANCE DETAILS
class AddMoneyTranscations {
  Future<String> getData() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final response = await http.get(
        Uri.parse('http://192.168.1.67:3000/balance'),
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

class AuthServices {
  final client = http.Client();

  Future<LoginModel> login(String username, String password) async {
    final Map<String, dynamic> body = {
      "username": username,
      "password": password,
    };
    try {
      final response = await client.post(
        Uri.parse('${API().baseUrl}${API().authUrl}'),
        headers: {'content-type': 'application/json'},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final LoginModel user = LoginModel.fromJson(result);

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('token', user.accessToken.toString());
        return user;
      } else {
        print(username);
        print("request fails");
      }
    } catch (error) {
      print('this is $error');
    }
    return LoginModel();
  }

  Future<LoginModel?> fetchUserProfile() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    try {
      final responst = await http.get(
        Uri.parse('https://dummyjson.com/auth/me'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-type': 'application/json',
        },
      );

      if (responst.statusCode == 200) {
        final result = jsonDecode(responst.body);
        return LoginModel.fromJson(result);
      } else {
        print(responst.body);
        print("Error");
      }
    } catch (e) {
      print("Error again");
    }
    return null;
  }

  Future<LoginModel?> getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');

    if (userString == null) return null;

    final userMap = jsonDecode(userString);
    return LoginModel.fromJson(userMap);
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
