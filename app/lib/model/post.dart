import './user.dart';
import './comment.dart';

class Post {

  final User user;
  final String title;
  final String description;
  final DateTime datePosted;
  final num numOfLikes;
  final List<Comment> comments;

  Post({
    required this.user,
    required this.title,
    required this.description,
    required this.datePosted,
    required this.numOfLikes,
    required this.comments,
  });

  User getUser() => user;
  String getTitle() => title;
  String getDescription() => description;
  DateTime getDatePosted() => datePosted;
  num getNumOfLikes() => numOfLikes;
  List<Comment> getComments() => comments;
}