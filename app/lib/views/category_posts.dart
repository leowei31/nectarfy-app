import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/community_module/featured_post.dart';
import './individual_post.dart';
import '../model/post.dart';
import '../model/user.dart';
import '../model/category.dart';
import '../model/comment.dart';

class CategoryPosts extends StatefulWidget {

  final Category category;

  CategoryPosts({ Key? key, required this.category }) : super(key: key);

  @override
  State<CategoryPosts> createState() => _CategoryPostsState();
}

class _CategoryPostsState extends State<CategoryPosts> {

  List<Widget> list = <Widget>[];
  bool loaded = false;

  @override
  Widget build(BuildContext context) {

    void _handlePost(Post post) {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => IndividualPost(post: post))
      );
    }

    void _initState() async {
      try {
        final url = Uri.parse('http://10.43.190.251:3000/post/category/${widget.category.getId()}');
        final response = await http.get(url);
        final posts = json.decode(response.body) as List<dynamic>;
        
        for (var post in posts) {
          List<dynamic> temp = post['likes'];
          List<String> likes = [];
          for (var like in temp) {
            likes.add(like['user']);
          }

          List<dynamic> temp2 = post['comments'];
          List<Comment> comments = [];
          for (var comment in temp2) {
            final User u = User(userId: comment['userId'], firstName: comment['username']);
            final Comment c = Comment(user: u, comment: comment['comment'], datePosted: DateTime.parse(comment['datePosted']));
            comments.add(c);
          }

          final User u = User(userId: post['user'], firstName: post['username']);
          final Post tempPost = Post(
            id: post['_id'],
            user: u, 
            title: post['title'], 
            description: post['description'], 
            datePosted: DateTime.parse(post['datePosted']),
            categoryId: post['category'],
            likes: likes, 
            comments: comments
          );

          list.add(FeaturedPost(post: tempPost, onPressedFn: _handlePost));

        }

        setState(() {
          loaded = true;
        });

        //iterate
      } catch (error) {
        rethrow;
      }
    }

    !loaded ? _initState() : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Community"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0, top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.category.getTitle(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const Padding(padding: EdgeInsets.only(bottom: 25.0)),
              
              Text('${list.length} post(s)', style: TextStyle(color: Colors.grey.withOpacity(0.95)),),
              const Padding(padding: EdgeInsets.only(bottom: 4.0)),

              Text(widget.category.getDescription()),
              const Padding(padding: EdgeInsets.only(bottom: 25.0)),
              
              const Text("All posts", style: TextStyle(fontWeight: FontWeight.bold),),
              const Padding(padding: EdgeInsets.only(bottom: 25.0)),
              !loaded ? const Text("LOADING!") : Column(
                children: list,
              )
            ],
          )
        ),
      )
    );
  }
}