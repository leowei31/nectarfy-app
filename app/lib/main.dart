import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import './views/hive_module.dart';
import './views/community_module.dart';
import './widgets/hive_module/hive_list/add_hive.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nectarfy',
      theme: ThemeData(
        primaryColor: const Color(0xFFE9C46A),
        accentColor: const Color(0xFF264653),
        fontFamily: 'Lato',
      ),
      home: const MyHomePage(title: 'Nectarfy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appbarHeight = AppBar().preferredSize.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SizedBox(
            height: (mediaQuery.size.height -
                appbarHeight -
                mediaQuery.padding.top -
                mediaQuery.padding.bottom),
            child: const CommunityModule()),
            // child: const HiveModule()),
            // Abstract later
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () => _addHiveHandler(context),
        // )
      );
  }
}
