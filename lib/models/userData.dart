import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class userData {
  String userName;
  String email;
  String id;

  userData({this.userName, this.email, this.id});

}

class Users with ChangeNotifier {
  List<userData> _users = [];

  List<userData> get users {
    return[..._users];
  }

  String authToken;
  String userId;

  Users(this.authToken, this.userId);

  Future<void> addUser(userData user) async {
    final url = Uri.parse('https://bcd-gp-default-rtdb.firebaseio.com/data-of-patients.json?auth=$authToken');
    try {
      final response = await http.post(url, body: json.encode({
        'user-email': user.email,
        'user-Name': user.userName,
        'patientID': userId,
      }));
      final newUser = userData(
        email: user.email,
        userName: user.userName,
      );
      _users.add(newUser);
      notifyListeners();
    } catch(e) {
      throw(e);
    }

    }
  }
