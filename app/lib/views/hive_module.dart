import 'package:flutter/material.dart';

import '../widgets/hive_module/dashboard/welcome_dashboard.dart';
import '../widgets/hive_module/hive_list/hive_list.dart';
import '../widgets/hive_module/hive_list/hive_list_controller.dart';
import '../model/hive.dart';
import '../model/action_item.dart';

class HiveModule extends StatefulWidget {
  const HiveModule({Key? key}) : super(key: key);

  @override
  _HiveModuleState createState() => _HiveModuleState();
}

class _HiveModuleState extends State<HiveModule> {
  bool allHives = true;

  final List<Hive> hives = [
    Hive(
        id: 'h1',
        name: 'Nectarfy #1',
        ownerId: '0',
        humidity: 12,
        temperature: 10,
        weight: 20,
        lastFed: DateTime.now(),
        hasActions: false,
        profilePicPath: 'hive_1.jpg'),
    Hive(
        id: 'h2',
        name: 'Nectarfy #2',
        ownerId: '0',
        humidity: 12,
        temperature: 10,
        weight: 20,
        lastFed: DateTime.now(),
        hasActions: true,
        profilePicPath: 'hive_2.jpg'),
    Hive(
        id: 'h3',
        name: 'Nectarfy #3',
        ownerId: '0',
        humidity: 12,
        temperature: 10,
        weight: 20,
        lastFed: DateTime.now(),
        hasActions: true,
        profilePicPath: 'hive_3.jpg'),
  ];

  final List<Hive> actionList = [
    // Hive(id: 'h2', name: 'hive 2', ownerId: '0', humidity: 12, temperature: 10, weight: 20, lastFed: DateTime.now(), hasActions: true, profilePicPath: 'hive_2.jpg'),
    // Hive(id: 'h3', name: 'hive 3', ownerId: '0', humidity: 12, temperature: 10, weight: 20, lastFed: DateTime.now(), hasActions: true, profilePicPath: 'hive_3.jpg'),
  ];

  // TO DO later
  final List<ActionItem> actionList2 = [
    ActionItem(
        actionId: 'a1',
        hiveId: 'h2',
        actionDescription:
            'Varroa Mite: our Nectarfy hive has detected the presence of Varroa Mite. '),
    ActionItem(
        actionId: 'a2',
        hiveId: 'h3',
        actionDescription:
            'Varroa Mite: our Nectarfy hive has detected the presence of Varroa Mite. ')
  ];

  void changeCategoryHandler() {
    setState(() {
      allHives = !allHives;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          WelcomeDashboard(name: 'Thiago', numOfActions: actionList.length),
          HiveListController(
              allHives: allHives, callbackFn: changeCategoryHandler),
          HiveList(
            listOfHives: hives,
            actionList: actionList,
            allHives: allHives,
          ),
        ],
      );
    });
  }
}
