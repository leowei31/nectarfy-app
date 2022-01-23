import 'package:flutter/material.dart';

import '../../model/hive.dart';

class HiveCard extends StatelessWidget {
  final Hive hive;

  const HiveCard({ Key? key, required this.hive }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        child: Row(children: <Widget>[
          const Text('Profile picture'),
          Column(children: <Widget>[
            Text(hive.getTemperature().toString()),
            Text(hive.getHumidity().toString()),
            Text(hive.getLastFed().toString()),
            Text(hive.getWeight().toString()),
          ],)
        ],),
      ));
  }
}