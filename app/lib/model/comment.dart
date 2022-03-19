import './user.dart';

class Comment {
  final User user;
  final String comment;
  final DateTime datePosted;

  Comment({
    required this.user,
    required this.comment,
    required this.datePosted
  });

  User getUser() => user;
  String getComment() => comment;
  DateTime getDatePosted() => datePosted;

}