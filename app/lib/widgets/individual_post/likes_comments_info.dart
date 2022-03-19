import 'package:flutter/material.dart';

class LikesCommentsInfo extends StatelessWidget {
  
  final num numOfLikes;
  final num numOfComments;

  const LikesCommentsInfo({ Key? key, required this.numOfLikes, required this.numOfComments }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          const Icon(Icons.favorite_outline,),
          const Padding(padding: EdgeInsets.only(right: 4.0)),
          Text('$numOfLikes'),
          const Padding(padding: EdgeInsets.only(right: 10.0)),
          const Icon(Icons.mode_comment_outlined),
          const Padding(padding: EdgeInsets.only(right: 4.0)),
          Text('$numOfComments'),

        ]
      ),
    );
  }
}