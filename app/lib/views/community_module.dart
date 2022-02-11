import 'package:flutter/material.dart';

class CommunityModule extends StatelessWidget {
  const CommunityModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Text("Community"),
    );
  }
}
