import 'package:flutter/material.dart';

import './welcome_user_title.dart';
import './action_items_dashboard.dart';

class WelcomeDashboard extends StatelessWidget {
  
  
  const WelcomeDashboard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Card(
        elevation: 5,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            WelcomeUserTitle(firstName: 'Thiago'),
            Expanded( 
              child: ActionItemsDashboard(actions: 5)
            )
          ],
        ),
      ));
  }
}