import 'package:app/provider/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/user_provider.dart';
import './views/menu_bar.dart';

import './views/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserState()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loggedin = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      loggedin = context.watch<UserState>().loggedin;
    });
    return MaterialApp(
      title: 'Nectarfy',
      theme: ThemeData(
        primaryColor: const Color(0xFFE9C46A),
        accentColor: const Color(0xFF264653),
        fontFamily: 'Lato',
      ),
      home: loggedin ? const MenuBar() : const LoginScreen(),
      // initialRoute: "/",
      // routes: {
      //   '/': (ctx) => const MenuBar(),
      //   '/login': (ctx) => const LoginScreen(),
      // },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   void _addHiveHandler(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (_) {
//           return AddHive(callbackFn: tempHandler);
//         });
//   }

//   void tempHandler() {
//     return;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final appbarHeight = AppBar().preferredSize.height;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           backgroundColor: Theme.of(context).primaryColor,
//         ),
//         body: SizedBox(
//             height: (mediaQuery.size.height -
//                 appbarHeight -
//                 mediaQuery.padding.top -
//                 mediaQuery.padding.bottom),
//             child: const HiveModule()),
//         floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.add),
//           onPressed: () => _addHiveHandler(context),
//         ));
//   }
// }
