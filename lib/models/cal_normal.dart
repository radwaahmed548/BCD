import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gp/models/cal_patient.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CalendarNormal {
  String id;
  DateTime dateOfExam;

  CalendarNormal({this.id, this.dateOfExam});
}

class CalNormal with ChangeNotifier {
  String _dateID;

  List<CalendarNormal> _currentDate = [];

  List<CalendarNormal> get currentDate {
    return [..._currentDate];
  }



  final String authToken;
  final String userID;

  CalNormal(this.authToken, this.userID);

  int findById(String id) {
    return _currentDate.indexWhere((element) => element.id == id);
  }

  String get dateID {
    return _dateID;
  }

  Future<void> fetchData() async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/normal-calendar.json?auth=$authToken&orderBy="patientID"&equalTo="$userID"');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if(extractedData == null) {
        return;
      }
      final List<CalendarNormal> loadedData = [];
      extractedData.forEach((id, date) {
        loadedData.add(CalendarNormal(
          id: id,
          dateOfExam: DateTime.parse(date['dateOfExam']),
        ));
      });
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('dateID')) {
        return false;
      }
      final extractedUserData = json.decode(prefs.getString('dateID')) as Map<String, Object>;

      _dateID = extractedUserData['dateID'];
      print(_dateID);
      _currentDate = loadedData;
      notifyListeners();
    } catch(e) {
      throw(e);
    }
  }

  Future<void> addCalendar(CalendarNormal calendar) async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/normal-calendar.json?auth=$authToken');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'dateOfExam': calendar.dateOfExam.toIso8601String(),
          'patientID': userID,
        }),
      );
      final newDate = CalendarNormal(
        id:json.decode(response.body)['name'],
        dateOfExam: calendar.dateOfExam,
      );

      _dateID = json.decode(response.body)['name'];
      //print(_dateID);
      _currentDate.add(newDate);
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final dateData = json.encode(
        {
          'dateID': _dateID,
        },
      );
      prefs.setString('dateID', dateData);
    } catch(e) {
      throw(e);
    }

  }

  Future<void> updateDate(String id, CalendarNormal newDate) async {
    final dateIndex = _currentDate.indexWhere((element) => element.id == id);
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/normal-calendar/$id.json?auth=$authToken');
    try {
      final response = await http.patch(url, body: json.encode({
        'dateOfExam': newDate.dateOfExam.toIso8601String(),
        'patientID': userID,
      }));
      _currentDate[dateIndex] = newDate;
      notifyListeners();
    } catch(e) {
      throw(e);
    }
  }
}