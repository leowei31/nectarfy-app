import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/user.dart';

class UserInfoHeader extends StatelessWidget {
  final User user;
  final DateTime datePosted;
  final double imageHeight;
  final bool omitPicture;
  final double fontSize;

  const UserInfoHeader({
    Key? key,
    required this.user,
    required this.datePosted,
    this.imageHeight = 40.0,
    this.omitPicture = false,
    this.fontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String convertToAgo(DateTime input) {
      Duration diff = DateTime.now().difference(input);

      if (diff.inDays >= 1) {
        if (diff.inDays > 31) {
          return DateFormat.yMMMd().format(datePosted.toLocal());
        } else {
          return '${diff.inDays} day(s) ago';
        }
      } else if (diff.inHours >= 1) {
        return '${diff.inHours} hour(s) ago';
      } else if (diff.inMinutes >= 1) {
        return '${diff.inMinutes} minute(s) ago';
      } else if (diff.inSeconds >= 1) {
        return '${diff.inSeconds} second(s) ago';
      } else {
        return 'just now';
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(children: [
          omitPicture
              ? const SizedBox.shrink()
              : ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: Image.asset(
                    'assets/images/no_profile_pic.png',
                    height: imageHeight,
                  ),
                ),
          const Padding(padding: EdgeInsets.only(right: 8.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '@${user.firstName} ${user.lastName}',
                style: TextStyle(fontSize: fontSize),
              ),
              Text(
                convertToAgo(datePosted),
                style: TextStyle(fontSize: fontSize),
              ),
            ],
          ),
        ]),
        Icon(
          Icons.flag_outlined,
          color: Colors.red.withOpacity(0.7),
        )
      ],
    );
  }
}
