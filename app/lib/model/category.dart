import './post.dart';

class Category {

  final String title;
  final String description;
  final List<Post> posts;

  Category ({
    required this.title,
    required this.description,
    required this.posts
  });

  String getTitle() => title;
  String getDescription() => description;
  List<Post> getPosts() => posts;

}