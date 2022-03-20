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
      ),
      body: Column(
        children: [
          Text("Personal"),
          RaisedButton(
              child: Text('Logout'),
              onPressed: () => context.read<UserState>().logoutsuccess()),
          context.watch<UserState>().loggedin
              ? const Text('Loggedin')
              : const Text('noo')
        ],
      ),
    );
  }
}
