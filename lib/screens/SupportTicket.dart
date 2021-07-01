import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:gp/screens/HelpCenter.dart';
import 'package:http/http.dart' as http;

class SupportTicket with ChangeNotifier {
  final String id;
  final String name;
  final String email;
  final String description;

  SupportTicket({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.description,
  });



  List<SupportTicket> _tickets = [];

  List<SupportTicket> get tickets {
    return[..._tickets];
  }



  SupportTicket findById(String id) {
    return _tickets.firstWhere((tick) => tick.id == id);
  }

  Future<void> addTicket(SupportTicket ticket) async {
    final url =
        Uri.parse('https://bcd-gp-default-rtdb.firebaseio.com/supporttickets.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'name': ticket.name,
          'email': ticket.email,
          'description': ticket.description,
        }),
      );
      final newTicket = SupportTicket(
        name: ticket.name,
        email: ticket.email,
        description: ticket.description,
        id: json.decode(response.body)['name'],
      );
      _tickets.add(newTicket);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
  Future<void> updateTicket(String id, SupportTicket newTicket) async {
    final tickIndex = _tickets.indexWhere((tick) => tick.id == id);
    if (tickIndex >= 0) {
      final url = Uri.parse('https://bcd-gp-default-rtdb.firebaseio.com/supporttickets$id.json');
      await http.patch(url,
          body: json.encode({
            'name': newTicket.name,
            'description': newTicket.description,
            'email': newTicket.email
          }));
      _tickets[tickIndex] = newTicket;
      notifyListeners();
    } else {
      print('...');
    }
  }
}
