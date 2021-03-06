import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Auth with ChangeNotifier{
  String _token;
  DateTime _expiretime;
  String _userID;
  Timer _authTimer;
  String _userName;
  String _uEmail;

  bool get isAuth {
    return token != null;
  }

  String get userName {
    return _userName;
  }

  String get uEmail {
    return _uEmail;
  }


  String get token {
    if (_expiretime != null &&
        _expiretime.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userID {
    return _userID;
  }

  Future<void> signUp(
      String email, String password, String userName) async {
    final url =
        Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCKqvgNHItjpsHYuj-iuyKKdsid5XQ0iCw');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'displayName': userName,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      print(responseData);
      _token = responseData['idToken'];
      _userID = responseData['localId'];
      _expiretime = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userID,
          'expiryDate': _expiretime.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  // Future<void> signup(String email, String password, String userName) async {
  //   return _authenticate(email, password, 'signUp', userName);
  // }

  Future<void> login(String email, String password) async {
    final url =
    Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCKqvgNHItjpsHYuj-iuyKKdsid5XQ0iCw');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userID = responseData['localId'];

      _expiretime = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userID,
          'expiryDate': _expiretime.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }


  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    print(extractedUserData);
    _token = extractedUserData['token'];
    _userID = extractedUserData['userId'];
    _expiretime = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userID = null;
    _expiretime = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiretime.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<void> getUserData() async{
    final url =
    Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyCKqvgNHItjpsHYuj-iuyKKdsid5XQ0iCw');
    final response = await http.post(url,
    body:{
    "idToken": _token,
    }
    );
    notifyListeners();
    print(response.body);
    _userName = json.decode(response.body)['users'][0]['displayName'];
    _uEmail = json.decode(response.body)['users'][0]['email'];
    print(_userName);
  }

  Future<void> updateUserData(String newUserName) async {
    final url =
    Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyCKqvgNHItjpsHYuj-iuyKKdsid5XQ0iCw');
    final response = await http.post(url, body: {
      'idToken': _token,
      'displayName': newUserName,
    });
    notifyListeners();
  }

}

