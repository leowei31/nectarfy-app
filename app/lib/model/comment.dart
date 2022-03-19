import './user.dart';

class Comment {
  final User user;
  final String comment;

  Comment({
    required this.user,
    required this.comment,
  });

  User getUser() => user;
  String getComment() => comment;

}