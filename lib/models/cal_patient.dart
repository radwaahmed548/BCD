import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CalendarData {
  String id;
  DateTime startDate;
  DateTime endDate;

  CalendarData(
    this.id,
    this.startDate,
    this.endDate,
  );
}

class CalPatient with ChangeNotifier {

  Future<void> addCalendar(DateTime startDate, DateTime endDate) async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/patient-calendar.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        }),
      );
      notifyListeners();
    } catch(e) {
      throw(e);
    }

    }
  }
