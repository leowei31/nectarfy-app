import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';

class ProfileModule extends StatelessWidget {
  const ProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("Personal")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            context.watch<UserState>().loggedin
                ? Text("Hello " + context.read<UserState>().username)
                : const Text('noo'),
            RaisedButton(
              child: Text('Logout'),
              onPressed: () {
                context.read<UserState>().getusername("");
                context.read<UserState>().logoutsuccess();
              },
            )
          ],
        ),
      ),
    );
  }
}
