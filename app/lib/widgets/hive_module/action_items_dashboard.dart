import 'package:flutter/material.dart';

class ActionItemsDashboard extends StatelessWidget {
  final int actions;
  
  const ActionItemsDashboard({ Key? key, required this.actions }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$actions action items');
  }
}