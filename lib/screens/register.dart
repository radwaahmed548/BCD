import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/components/background.dart';
import 'package:gp/models/httpException.dart';
import 'package:gp/models/userData.dart';
import 'package:provider/provider.dart';
import '../models/login_auth.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  final GlobalKey<FormState> _formkey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'userName': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
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

  Future<void> submit() async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).signUp(
        _authData['email'],
        _authData['password'],
        _authData['userName'],
      ).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch(e)
    {
      const e =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(e);
    }

  }

  //var user = userData(email: _authData['email'], userName: null);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: Form(
          key: _formkey,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 55),
                    child: Image(
                      image: AssetImage('images/Picture2.png'),
                      width: 50,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: KMainColor,
                        fontSize: 36,
                        fontFamily: "Raleway",
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                    },
                    onSaved: (value) {
                      _authData['email'] = value;
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Username"),
                    validator: (value) {
                      if (value.isEmpty)
                        {
                          return 'Enter Username!!';
                        }
                    },
                    onSaved: (value) {
                      _authData['userName'] = value;
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      }
                    },
                    onSaved: (value) {
                      _authData['password'] = value;
                    },
                  ),
                  SizedBox(height: size.height * 0.05),
                  _isLoading
                      ? CircularProgressIndicator()
                      : Container(
                          alignment: Alignment.centerRight,
                          margin:
                              EdgeInsets.symmetric(vertical: 10),
                          child: RaisedButton(
                            onPressed: () {
                              print(_authData['email']);
                              Provider.of<Users>(context, listen: false).addUser(userData(email: _authData['email'], userName: _authData['userName']));
                              submit();
                              Navigator.pushNamed(context, '/home');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              width: size.width * 0.5,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(80.0),
                                  color: KMainColor),
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "SIGN UP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {Navigator.pushNamed(context, '/login')},
                      child: Text(
                        "Already Have an Account? Sign in",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: KSecondColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
