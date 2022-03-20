// import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../services/authservice.dart';
import '../provider/user_provider.dart';

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
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'Welcome to Nectarfy',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (val) {
                  name = val;
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (val) {
                  password = val;
                },
              ),
              Column(
                children: [
                  ElevatedButton(
                      child: Text("Add User"),
                      onPressed: () {
                        AuthService().addUser(name, password).then((val) {
                          // Fluttertoast.showToast(
                          //   msg: val.data['msg'],
                          //   toastLength: Toast.LENGTH_SHORT,
                          //   gravity: ToastGravity.BOTTOM,
                          //   timeInSecForIosWeb: 1,
                          //   backgroundColor: Colors.green,
                          //   textColor: Colors.white,
                          //   fontSize: 16.0,
                          // );
                        });
                      }),
                  ElevatedButton(
                      child: const Text("Login"),
                      onPressed: () {
                        AuthService().login(name, password).then((val) {
                          if (val.data['success']) {
                            token = val.data['token'];
                            // Fluttertoast.showToast(
                            //   msg: 'Authenticated',
                            //   toastLength: Toast.LENGTH_SHORT,
                            //   gravity: ToastGravity.BOTTOM,
                            //   timeInSecForIosWeb: 1,
                            //   backgroundColor: Colors.green,
                            //   textColor: Colors.white,
                            //   fontSize: 16.0,
                            // );
                            AuthService().getinfo(token).then((val) {
                              context
                                  .read<UserState>()
                                  .getusername(val.data['msg']);
                              print(val.data['msg']);
                              context.read<UserState>().loginsuccess();
                            });
                          }
                        });
                      }),
                ],
              ),

              // RaisedButton(
              //     child: Text("Get Info"),
              //     onPressed: () {
              //       AuthService().getinfo(token).then((val) {
              //         Fluttertoast.showToast(
              //           msg: val.data['msg'],
              //           toastLength: Toast.LENGTH_SHORT,
              //           gravity: ToastGravity.BOTTOM,
              //           timeInSecForIosWeb: 1,
              //           backgroundColor: Colors.green,
              //           textColor: Colors.white,
              //           fontSize: 16.0,
              //         );
              //       });
              //     }),
            ]),
      ),
    );
  }
}
