import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gp/models/cal_patient.dart';
import 'package:http/http.dart' as http;

class CalendarNormal {
  String id;
  DateTime dateOfExam;

  CalendarNormal({this.id, this.dateOfExam});
}

class CalNormal with ChangeNotifier {

  List<CalendarNormal> _currentDate = [];

  List<CalendarNormal> get currentDate {
    return [..._currentDate];
  }

  final String authToken;
  final String userID;

  CalNormal(this.authToken, this.userID);

  CalendarNormal findById(String id) {
    return _currentDate.firstWhere((element) => element.id == id);
  }

  Future<void> addCalendar(DateTime dateOfExam) async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/normal-calendar.json?auth=$authToken');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'dateOfExam': dateOfExam.toIso8601String(),
          'patientID': userID,
        }),
      );
      notifyListeners();
    } catch(e) {
      throw(e);
    }

  }

  Future<void> fetchData() async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/normal-calendar.json?auth=$authToken&orderBy="patientID"&equalTo="$userID"');
    
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<CalendarNormal> loadedData = [];
      extractedData.forEach((id, date) {
        loadedData.add(CalendarNormal(
          id: id,
          dateOfExam: DateTime.parse(date['dateOfExam']),
        ));
      });
      _currentDate = loadedData;
      notifyListeners();
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
        'dateOfExam': newDate.dateOfExam,
      }));
      _currentDate[dateIndex] = newDate;
      notifyListeners();
    } catch(e) {
      throw(e);
    }
  }
}