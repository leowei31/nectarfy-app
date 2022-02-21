import 'package:flutter/material.dart';

import '../../../model/hive.dart';
import './hive_card.dart';

class HiveList extends StatelessWidget {
  final List<Hive> listOfHives;
  final List<Hive> actionList;
  final bool allHives;

  const HiveList(
      {Key? key,
      required this.listOfHives,
      required this.actionList,
      required this.allHives})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(
      children: <Widget>[
        (allHives && listOfHives.isEmpty) || (!allHives && actionList.isEmpty)
            ? Column(
                children: <Widget>[
                  Image.asset('assets/images/no_hive.png'),
                  const Text('No hives to display!'),
                ],
              )
            : SizedBox(
                height: mediaQuery.size.height * 0.42,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (ctx, i) {
                    return HiveCard(
                        hive: allHives ? listOfHives[i] : actionList[i]);
                  },
                  itemCount: allHives ? listOfHives.length : actionList.length,
                ))
      ],
    );
  }
}
