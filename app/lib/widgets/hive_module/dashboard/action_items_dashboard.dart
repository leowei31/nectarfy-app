import 'package:flutter/material.dart';

class ActionItemsDashboard extends StatelessWidget {
  final int actions;
  
  const ActionItemsDashboard({ Key? key, required this.actions }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, top: 0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: const Color(0x00000000),
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.white),
            )
          ), 
          Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(actions.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
            const Text('action items.', style: TextStyle(fontSize: 13, color: Colors.white))
          ])
        ], 
        alignment: AlignmentDirectional.center
      )
    );
  }
}