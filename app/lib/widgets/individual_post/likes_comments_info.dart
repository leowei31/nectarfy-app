import 'package:flutter/material.dart';

class LikesCommentsInfo extends StatelessWidget {
  
  final num numOfLikes;
  final num numOfComments;
  final double? size;
  final double? fontSize;
  final Color? textColor;
  final Color? iconColor;

  const LikesCommentsInfo({ 
    Key? key, 
    required this.numOfLikes, 
    required this.numOfComments, 
    this.size = 22,
    this.fontSize = 14,
    this.textColor = Colors.black,
    this.iconColor = Colors.black
  }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.favorite_outline, size: size, color: iconColor,),
          const Padding(padding: EdgeInsets.only(right: 4.0)),
          Text('$numOfLikes', style: TextStyle(fontSize: fontSize, color: textColor),),
          const Padding(padding: EdgeInsets.only(right: 10.0)),

          Icon(Icons.mode_comment_outlined, size: size, color: iconColor,),
          const Padding(padding: EdgeInsets.only(right: 4.0)),
          Text('$numOfComments', style: TextStyle(fontSize: fontSize, color: textColor),),

        ]
      ),
    );
  }
}