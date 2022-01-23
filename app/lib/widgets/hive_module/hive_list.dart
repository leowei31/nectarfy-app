import 'package:flutter/material.dart';

import '../../model/hive.dart';
import './hive_card.dart';

class HiveList extends StatefulWidget {
  const HiveList({ Key? key }) : super(key: key);

  @override
  _HiveListState createState() => _HiveListState();
}

class _HiveListState extends State<HiveList> {

  final List<Hive> listOfHives = [
    Hive(id: 'h1', name: 'hive 1', ownerId: '0', humidity: 12, temperature: 10, weight: 20, lastFed: DateTime.now(), hasActions: false),
    Hive(id: 'h2', name: 'hive 2', ownerId: '0', humidity: 12, temperature: 10, weight: 20, lastFed: DateTime.now(), hasActions: true),
    Hive(id: 'h3', name: 'hive 3', ownerId: '0', humidity: 12, temperature: 10, weight: 20, lastFed: DateTime.now(), hasActions: true),
    Hive(id: 'h4', name: 'hive 4', ownerId: '0', humidity: 12, temperature: 10, weight: 20, lastFed: DateTime.now(), hasActions: false),
    Hive(id: 'h5', name: 'hive 5', ownerId: '0', humidity: 12, temperature: 10, weight: 20, lastFed: DateTime.now(), hasActions: false),
  ];

  final List<Hive> actionList = [
    Hive(id: 'h2', name: 'hive 2', ownerId: '0', humidity: 12, temperature: 10, weight: 20, lastFed: DateTime.now(), hasActions: true),
    Hive(id: 'h3', name: 'hive 3', ownerId: '0', humidity: 12, temperature: 10, weight: 20, lastFed: DateTime.now(), hasActions: true),
  ];

  bool allHives = true;

  void changeCategoryHandler() {
    setState(() {
      allHives = !allHives;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(onPressed: changeCategoryHandler, icon: const Icon(Icons.keyboard_arrow_left_outlined)),
              Text(allHives ? 'All hives' : 'Action items'),
              IconButton(onPressed: changeCategoryHandler, icon: const Icon(Icons.keyboard_arrow_right_outlined)),
        ],),),
        
        SizedBox(
          height: 400,
          width: double.infinity,
          child: ListView.builder(
          itemBuilder: (ctx, i) {
            return HiveCard(hive: allHives ? listOfHives[i] : actionList[i]);
            // return HiveCard(hive: listOfHives[i]);
          },
          itemCount: allHives ? listOfHives.length : actionList.length,
        ))

      ],
    );
  }
}