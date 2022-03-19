import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/user.dart';

class UserInfoHeader extends StatelessWidget {

  final User user;
  final DateTime datePosted;

  const UserInfoHeader({ 
    Key? key, 
    required this.user, 
    required this.datePosted 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(40)),
            child: Image.asset('assets/images/no_profile_pic.png', height: 40,),
          ),
          const Padding(padding: EdgeInsets.only(right: 8.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${user.firstName} ${user.lastName}', style: const TextStyle(fontSize: 12),),
              Text(DateFormat.yMMMd().format(datePosted), style: const TextStyle(fontSize: 12),),
            ],
          )
        ],
      )
    );
  }
}