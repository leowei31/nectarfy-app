import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Name'),
          onChanged: (val) {
            name = val;
          },
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Name'),
          onChanged: (val) {
            password = val;
          },
        ),
        SizedBox(height: 100),
        RaisedButton(child: Text("Login"), onPressed: () {}),
      ]),
    );
  }
}
