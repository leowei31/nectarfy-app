import 'package:flutter/material.dart';

import '../../../model/hive.dart';
import './hive_card.dart';

class HiveList extends StatelessWidget {
  final List<Hive> listOfHives;
  final List<Hive> actionList;
  final bool allHives;
  final Function onPressedFn;

  const HiveList(
      {Key? key,
      required this.listOfHives,
      required this.actionList,
      required this.allHives,
      required this.onPressedFn
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(
      children: <Widget>[
        (allHives && listOfHives.isEmpty) || (!allHives && actionList.isEmpty)
            ? Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 35),
                    child: Image.asset('assets/images/no_hive.png', height: 200,),
                  ),
                  const Text('No hives to display!'),
                ],
              )
            : SizedBox(
                height: mediaQuery.size.height * 0.4,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (ctx, i) {
                    return HiveCard(
                        hive: allHives ? listOfHives[i] : actionList[i],
                        onPressedFn: onPressedFn,
                        );
                  },
                  itemCount: allHives ? listOfHives.length : actionList.length,
                ))
      ],
    );
  }
}
