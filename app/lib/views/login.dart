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
              Image.network(
                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/261068965_1074230923416416_6405014183967018013_n.png?_nc_cat=102&ccb=1-5&_nc_sid=aee45a&_nc_ohc=Aladpss0sRMAX9v7Nyr&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVJBCnlwJ0q2aJlzQKIBB76ODJUQKS9RWmVi92KOtJSNhw&oe=625D8569',
                  height: 150,
                  width: 150),
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
                  SizedBox(height: 20),
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
                            AuthService().getuserid(token).then((val) {
                              context
                                  .read<UserState>()
                                  .getuserid(val.data['msg']);
                              print(val.data['msg']);
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
