import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/hive.dart';

class HiveCard extends StatelessWidget {
  final Hive hive;
  final Function onPressedFn;

  const HiveCard({ Key? key, required this.hive, required this.onPressedFn }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressedFn(hive.getId(), hive.getName());
      },
      child: Container(
        height: 170,
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        child: Card(
          elevation: 3,
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
                      Container(
                        margin: const EdgeInsets.only(top: 7),
                        child: Text(
                          hive.getName(),
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                      )),
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
                        const Padding(padding: EdgeInsets.only(right: 3.5)),
                        const Text('Current temperature: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        Text(
                          hive.getTemperature() == "Error" || hive.getTemperature() == "Loading" ? hive.getTemperature() : '${double.parse(hive.getTemperature())}º C',
                          style: const TextStyle(fontSize: 12),
                        )
                      ]),
                      Row(children: <Widget>[
                        const Icon(
                          Icons.water,
                          color: Color.fromRGBO(231, 111, 81, 100),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 3.5)),
                        const Text('Current humidity: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        Text(
                          hive.getHumidity() == "Error" || hive.getHumidity() == "Loading" ? hive.getHumidity() : '${double.parse(hive.getHumidity())}%',
                          style: const TextStyle(fontSize: 12),
                        )
                      ]),
                      Row(children: <Widget>[
                        const Icon(
                          Icons.monitor_weight,
                          color: Color.fromRGBO(231, 111, 81, 100),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 3.5)),
                        const Text('Current weight: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        Text(
                          '${hive.getWeight().toString()} kg',
                          style: const TextStyle(fontSize: 12),
                        )
                      ]),
                      Row(children: <Widget>[
                        const Icon(
                          Icons.food_bank,
                          color: Color.fromRGBO(231, 111, 81, 100),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 3.5)),
                        const Text('Last fed: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        Text(
                          DateFormat.yMMMMd().format(hive.getLastFed()),
                          style: const TextStyle(fontSize: 12),
                        )
                      ]),
                ],)),
          ],),
        )),
    );
  }
}