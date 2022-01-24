import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container( 
                margin: const EdgeInsets.only(left: 25),
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/${hive.getProfilePicPath()}'),
                        radius: 35,
                      ),
                    Text(hive.getName())
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(right: 25),
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      const Icon(
                        Icons.thermostat,
                        color: Color.fromRGBO(231, 111, 81, 100),
                      ),
                      Text('Current temperature: ${hive.getTemperature().toString()}º C')
                    ]),
                    Row(children: <Widget>[
                      const Icon(
                        Icons.water,
                        color: Color.fromRGBO(231, 111, 81, 100),
                      ),
                      Text('Current humidity: ${hive.getHumidity().toString()}%')
                    ]),
                    Row(children: <Widget>[
                      const Icon(
                        Icons.monitor_weight,
                        color: Color.fromRGBO(231, 111, 81, 100),
                      ),
                      Text('Current weight: ${hive.getWeight().toString()} kg')
                    ]),
                    Row(children: <Widget>[
                      const Icon(
                        Icons.food_bank,
                        color: Color.fromRGBO(231, 111, 81, 100),
                      ),
                      Text('Last fed: ${DateFormat.yMMMMd().format(hive.getLastFed())}')
                    ]),
              ],)),
        ],),
      ));
  }
}