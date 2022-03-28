import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import '../widgets/hive_module/dashboard/welcome_dashboard.dart';
import '../widgets/hive_module/hive_list/hive_list.dart';
import '../widgets/hive_module/hive_list/hive_list_controller.dart';
import '../model/hive.dart';
import '../model/action_item.dart';
import '../widgets/hive_module/hive_list/add_hive.dart';
import '../provider/user_provider.dart';

class HiveModule extends StatefulWidget {
  const HiveModule({Key? key}) : super(key: key);

  @override
  _HiveModuleState createState() => _HiveModuleState();
}

class _HiveModuleState extends State<HiveModule> {

  /// SEPARATOR
  /// Method and field definition for bluetooth

  static const platform = MethodChannel('samples.flutter.dev/temperature');

  bool loaded = false;
  String _temperatureLevel = "Loading";
  String _humidityLevel = "Loading";

  Future<void> _getTemperatureLevel() async {
    try {
      String res = await platform.invokeMethod('getTemperatureLevel'); 
      print("TEMPERATURE: ${res.split(" ")[0]}");
      print("HUMIDITY: ${res.split(" ")[1]}");

      setState(() {
        _temperatureLevel = res.split(" ")[0];
        _humidityLevel = res.split(" ")[1];
        loaded = true;
      });
    } on PlatformException catch (e) {
      print(e);
    }

  }

  /// SEPARATOR
  ///


  void _addHiveHandler(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddHive(callbackFn: tempHandler);
        });
  }

  void tempHandler() {
    return;
  }

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

  void _handleHiveCard(String hiveId, String hiveName) {
    print('Id: $hiveId');
    print('Title: $hiveName');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appbarHeight = AppBar().preferredSize.height;
    final username = context.watch<UserState>().username;

    !loaded ? _getTemperatureLevel() : null;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Your Hives'),
        ),
        body: SizedBox(
            height: (mediaQuery.size.height -
                appbarHeight -
                mediaQuery.padding.top -
                mediaQuery.padding.bottom),
            child: Column(
              children: <Widget>[
                Text(_temperatureLevel),
                Text(_humidityLevel),
                WelcomeDashboard(
                    name: username, numOfActions: actionList.length),
                HiveListController(
                    allHives: allHives, callbackFn: changeCategoryHandler),
                HiveList(
                  listOfHives: hives,
                  actionList: actionList,
                  allHives: allHives,
                  onPressedFn: _handleHiveCard,
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _addHiveHandler(context),
        ));
  }
}
