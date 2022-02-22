import 'package:flutter/material.dart';

import '../widgets/community_module/community_board.dart';

class CommunityModule extends StatelessWidget {
  const CommunityModule({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: 
        Column(
          children: const <Widget>[
            // Community Board
            CommunityBoard(),

            // Hot post #1
            // Hot post #2
            // Categories
          ],          
        ),
    );
  }
}