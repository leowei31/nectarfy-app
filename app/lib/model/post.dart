import './user.dart';
import './comment.dart';

class Post {
  final String id;
  final User user;
  final String title;
  final String description;
  final DateTime datePosted;
  final String categoryId;
  final List<String> likes;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.user,
    required this.title,
    required this.description,
    required this.datePosted,
    required this.categoryId,
    required this.likes,
    required this.comments,
  });

  String getId() => id;
  User getUser() => user;
  String getTitle() => title;
  String getDescription() => description;
  DateTime getDatePosted() => datePosted;
  String getCategoryId() => categoryId;
  List<String> getLikes() => likes;
  List<Comment> getComments() => comments;
}
