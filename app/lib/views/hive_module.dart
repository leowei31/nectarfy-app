import 'package:flutter/material.dart';

import '../widgets/hive_module/welcome_dashboard.dart';
import '../widgets/hive_module/hive_list.dart';

class HiveModule extends StatelessWidget {
  
  const HiveModule({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        WelcomeDashboard(),
        HiveList(),
      ],
    );
  }
}