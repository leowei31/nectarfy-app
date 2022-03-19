import 'package:flutter/material.dart';

import './user_info_header.dart';
import '../../model/comment.dart';

class CommentCard extends StatelessWidget {

  final Comment comment;

  const CommentCard({ Key? key, required this.comment }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 10)),
          UserInfoHeader(user: comment.getUser(), datePosted: comment.getDatePosted()),
          const Padding(padding: EdgeInsets.only(bottom: 12.0)),
          Text(comment.getComment(), style: const TextStyle(fontSize: 14)),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
        ],
      ),
    );
  }
}