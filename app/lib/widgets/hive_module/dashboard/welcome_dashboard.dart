import 'package:flutter/material.dart';

import './welcome_user_title.dart';
import './action_items_dashboard.dart';

class WelcomeDashboard extends StatelessWidget {
  final String name;
  final int numOfActions;

  const WelcomeDashboard(
      {Key? key, required this.name, required this.numOfActions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
        width: double.infinity,
        height: mediaQuery.size.height * 0.26,
        child: Card(
          elevation: 5,
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              WelcomeUserTitle(firstName: name),
              ActionItemsDashboard(actions: numOfActions)
            ],
          ),
        ));
  }
}
