import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:gp/components/tools.dart';

// ignore: unused_import
import 'package:gp/components/maindrawer.dart';

// ignore: unused_import
import 'package:gp/main.dart';
import 'package:provider/provider.dart';
import 'package:gp/screens/SupportTicket.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key key}) : super(key: key);
  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedTicket =
      SupportTicket(id: '', name: '', email: '', description: '');

  var _initValues = {
    'name': '',
    'email': '',
    'description': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final TicketId = ModalRoute.of(context).settings.arguments as String;
      if (TicketId != null) {
        _editedTicket =
            Provider.of<SupportTicket>(context, listen: false)
            .findById(TicketId);
        _initValues = {
          'name': _editedTicket.name,
          'email': _editedTicket.email,
          'description': _editedTicket.description,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _descriptionFocusNode.dispose();

    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedTicket.id != null) {
      await Provider.of<SupportTicket>(context, listen: false)
          .updateTicket(_editedTicket.id, _editedTicket);
    } else {
      try {
        await Provider.of<SupportTicket>(context, listen: false)
            .addTicket(_editedTicket);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formkey;
    return Scaffold(
      backgroundColor: Kgradintstartcolor,
      key: _drawerKey,
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: KMainColor,
        title: Text("Help Center"),
        actions: <Widget>[
          GestureDetector(
            child: IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  _saveForm();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Profile Edited Successfully!'),
                    ),
                  );

                }),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              TextFormField(
                initialValue: _initValues['name'],
                decoration: InputDecoration(labelText: 'Enter Your Name'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a Name.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedTicket = SupportTicket(
                      name: value,
                      email: _editedTicket.email,
                      description: _editedTicket.description,
                      id: _editedTicket.id);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                initialValue: _initValues['email'],
                decoration: InputDecoration(
                  labelText: "Please Enter Your E-mail",
                ),
                textInputAction: TextInputAction.next,
                focusNode: _emailFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Invalid email!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedTicket = SupportTicket(
                      name: _editedTicket.name,
                      email: (value),
                      description: _editedTicket.description,
                      id: _editedTicket.id);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(
                  labelText:
                      "Please briefly describe your question or the issue you're facing",
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  if (value.length < 10) {
                    return 'Should be at least 10 characters long.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedTicket = SupportTicket(
                    name: _editedTicket.name,
                    email: _editedTicket.email,
                    description: value,
                    id: _editedTicket.id,
                  );
                },
              ),

            ],
          ),
        )
      )
    );
  }
}
