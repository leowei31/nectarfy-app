import 'package:flutter/material.dart';

class HiveListController extends StatelessWidget {
  final bool allHives;
  final Function callbackFn;
  
  const HiveListController({ Key? key, required this.allHives, required this.callbackFn }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(onPressed: () => callbackFn(), icon: const Icon(Icons.keyboard_arrow_left_outlined)),
          Container(
            width: 250,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 0.5,
                )
              ]
            ),
            child: Center(child: Text(
              allHives ? 'ALL HIVES' : 'ACTION ITEMS',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            )),
          ),
          IconButton(onPressed: () => callbackFn(), icon: const Icon(Icons.keyboard_arrow_right_outlined)),
    ]));
  }
}