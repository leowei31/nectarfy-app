import "package:flutter/material.dart";

import '../../model/post.dart';
import '../individual_post/likes_comments_info.dart';
import '../individual_post/user_info_header.dart';

class FeaturedPost extends StatelessWidget {

  final Post post;
  final Function onPressedFn;

  const FeaturedPost({ 
    Key? key, 
    required this.post,
    required this.onPressedFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final String _trimmedDescription = Characters(post.getDescription()).length < 251 ? post.getDescription() : '${post.getDescription().substring(0, 251)}...';

    return InkWell(
      onTap: () {
        onPressedFn(post);
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: 100,
        ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                UserInfoHeader(user: post.getUser(), datePosted: post.getDatePosted(), imageHeight: 30.0, fontSize: 10,),
                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(post.getTitle(), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(_trimmedDescription, style: const TextStyle(fontSize: 10, color: Colors.blueGrey)),
                ),
                const Padding(padding: EdgeInsets.only(top: 10.0)),
                LikesCommentsInfo(numOfLikes: post.getLikes().length, numOfComments: post.getComments().length, size: 15.0, fontSize: 12, iconColor: Colors.grey, textColor: Colors.grey, onPressedFn: () {},)
              ],
            ),
          )
        ),
    );
  }
}