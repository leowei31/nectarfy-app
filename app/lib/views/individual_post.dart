import 'package:flutter/material.dart';

class IndividualPost extends StatelessWidget {
  
  
  const IndividualPost({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            Text("User info, tags, and date posted"),
            Text("START POST"),
            Text("title"),
            Text("description"),
            Text("comments"),
          ],
        ),
      ),
    );
  }
}