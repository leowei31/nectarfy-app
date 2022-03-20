import 'package:fluttertoast/fluttertoast.dart';

import '../services/authservice.dart';
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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
            RaisedButton(
                child: Text("Add User"),
                onPressed: () {
                  AuthService().addUser(name, password).then((val) {
                    Fluttertoast.showToast(
                      msg: val.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  });
                }),
            RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  AuthService().login(name, password).then((val) {
                    if (val.data['success']) {
                      token = val.data['token'];
                      Fluttertoast.showToast(
                        msg: 'Authenticated',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  });
                }),
            RaisedButton(
                child: Text("Get Info"),
                onPressed: () {
                  AuthService().getinfo(token).then((val) {
                    Fluttertoast.showToast(
                      msg: val.data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  });
                }),
          ]),
    );
  }
}
