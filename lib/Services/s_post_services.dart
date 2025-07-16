import 'dart:convert';

import 'package:http/http.dart' as http;

class PostDetails{
 Future<List<dynamic>> getData() async{
  try{
    final response = await http.get(Uri.parse('https://dummyjson.com/posts'));

    if(response.statusCode==200){
      return jsonDecode(response.body);
    }
    else{
      throw Exception ('error ${response.statusCode} and ${response.body}');
    }

  }catch(e){
    print('$e error');
    return [];
  }
 }
}