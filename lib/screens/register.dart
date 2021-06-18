import 'package:flutter/material.dart';
import 'package:gp/components/tools.dart';
import 'package:gp/components/background.dart';
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
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  Future<void> submit() async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    {
      await Provider.of<Auth>(context, listen: false).signup(
        _authData['email'],
        _authData['password'],
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

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
                TextField(
                  decoration: InputDecoration(labelText: "Username"),
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
    );
  }
}
