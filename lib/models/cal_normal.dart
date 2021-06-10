import 'dart:convert';

import 'package:flutter/material.dart';
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

  Future<void> addCalendar(DateTime dateOfExam) async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/normal-calendar.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': DateTime.now().toIso8601String(),
          'dateOfExam': dateOfExam.toIso8601String(),
        }),
      );
      notifyListeners();
    } catch(e) {
      throw(e);
    }

  }

  Future<void> fetchData() async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/normal-calendar.json');
    
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
}