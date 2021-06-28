import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CalendarData {
  String id;
  DateTime firstStepStartDate;
  DateTime firstStepEndDate;
  DateTime secondStepStartDate;
  DateTime secondStepEndDate;
  DateTime thirdStepStartDate;
  DateTime thirdStepEndDate;

  CalendarData({
    this.id,
    this.firstStepStartDate,
    this.firstStepEndDate,
    this.secondStepStartDate,
    this.secondStepEndDate,
    this.thirdStepStartDate,
    this.thirdStepEndDate,
  });
}

class CalPatient with ChangeNotifier {
  String _dateID;

  List<CalendarData> _currentDate = [];

  List<CalendarData> get currentDate {
    return [..._currentDate];
  }

  final String authToken;
  final String userID;

  CalPatient(this.authToken, this.userID);

  String get dateID {
    return _dateID;
  }

  Future<void> addCalendar(
    DateTime firstStepStartDate,
    DateTime firstStepEndDate,
    DateTime secondStepStartDate,
    DateTime secondStepEndDate,
    DateTime thirdStepStartDate,
    DateTime thirdStepEndDate,
  ) async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/patient-calendar.json?auth=$authToken');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'firstStep-startDate': firstStepStartDate.toIso8601String(),
          'firstStep-endDate': firstStepEndDate.toIso8601String(),
          'secondStep-startDate': secondStepStartDate.toIso8601String(),
          'secondStep-endDate': secondStepEndDate.toIso8601String(),
          'thirdStep-startDate': thirdStepStartDate.toIso8601String(),
          'thirdStep-endDate': thirdStepEndDate.toIso8601String(),
          'patientID': userID,
        }),
      );
      final newDate = CalendarData(
        id: json.decode(response.body)['name'],
        firstStepStartDate: firstStepStartDate,
        firstStepEndDate: firstStepEndDate,
        secondStepStartDate: secondStepStartDate,
        secondStepEndDate: secondStepEndDate,
        thirdStepStartDate: thirdStepStartDate,
        thirdStepEndDate: thirdStepEndDate,
      );
      _dateID = json.decode(response.body)['name'];
      //print(_dateID);
      _currentDate.add(newDate);
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final dateData2 = json.encode(
        {
          'dateId': _dateID,
        },
      );
      prefs.setString('dateId', dateData2);
    } catch (e) {
      throw (e);
    }
  }

  Future<void> fetchDate() async {
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/patient-calendar.json?auth=$authToken&orderBy="patientID"&equalTo="$userID"');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map <String, dynamic>;
      final List<CalendarData> loadedData = [];
      extractedData.forEach((id, date) {
        loadedData.add(CalendarData(
          id: id,
          firstStepStartDate: DateTime.parse(date['firstStep-startDate']),
          firstStepEndDate: DateTime.parse(date['firstStep-endDate']),
          secondStepStartDate: DateTime.parse(date['secondStep-startDate']),
          secondStepEndDate: DateTime.parse(date['secondStep-endDate']),
          thirdStepStartDate: DateTime.parse(date['thirdStep-startDate']),
          thirdStepEndDate: DateTime.parse(date['thirdStep-endDate']),
        ));
      });
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('dateId')) {
        return false;
      }
      final extractedUserData = json.decode(prefs.getString('dateId')) as Map<String, Object>;

      _dateID = extractedUserData['dateId'];
      print(_dateID);
      _currentDate = loadedData;
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> updateDate(String id, CalendarData newDate) async {
    final dateIndex = _currentDate.indexWhere((element) => element.id == id);
    final url = Uri.parse(
        'https://bcd-gp-default-rtdb.firebaseio.com/patient-calendar/$id.json?auth=$authToken');
    try {
      final response = await http.patch(url, body: json.encode({
        'firstStep-startDate': newDate.firstStepStartDate.toIso8601String(),
        'firstStep-endDate': newDate.firstStepEndDate.toIso8601String(),
        'secondStep-startDate': newDate.secondStepStartDate.toIso8601String(),
        'secondStep-endDate': newDate.secondStepEndDate.toIso8601String(),
        'thirdStep-startDate': newDate.thirdStepStartDate.toIso8601String(),
        'thirdStep-endDate': newDate.thirdStepEndDate.toIso8601String(),
        'patientID': userID,
      }));
      _currentDate[dateIndex] = newDate;
      notifyListeners();
    } catch(e) {
      throw(e);
    }
  }
}

