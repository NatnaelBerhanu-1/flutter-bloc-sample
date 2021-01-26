import 'dart:convert';

import 'package:flutter_bloc_with_emnet/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  Future<List<User>> getUsers()async{
    var response =
    await http.get('https://jsonplaceholder.typicode.com/users');
    print(response.body);
    List<User> users = List();

    List<Map<String, dynamic>> rawJson =
    jsonDecode(response.body).cast<Map<String, dynamic>>();
    rawJson.forEach((element) {
      users.add(User.fromJson(element));
    });
    return users;
  }
}