import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class SingleCategory extends StatelessWidget {

  final String title;
  final Function onPressedFn;
  
  const SingleCategory({ Key? key, required this.title, required this.onPressedFn }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          onPressedFn(title);
        },
        child: Card(
          color: Theme.of(context).primaryColor.withOpacity(0.60),
          elevation: 0,
          child: Center(child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12))),
        ),
      ),
    );
  }
}