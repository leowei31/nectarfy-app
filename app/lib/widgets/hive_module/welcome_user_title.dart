import 'package:flutter/material.dart';

class WelcomeUserTitle extends StatelessWidget {
  final String firstName;

  const WelcomeUserTitle({ Key? key, required this.firstName }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Good morning,', style: TextStyle(color: Colors.white, fontSize: 16),),
          Text('$firstName.', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}