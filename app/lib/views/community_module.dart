import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/community_module/community_board.dart';
import '../widgets/community_module/featured_post.dart';
import './individual_post.dart';
import './category_posts.dart';
import '../model/comment.dart';
import '../model/post.dart';
import '../model/user.dart';
import '../model/category.dart';
import '../widgets/community_module/new_post.dart';
import "../widgets/community_module/single_category.dart";

class CommunityModule extends StatefulWidget {
  const CommunityModule({
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityModule> createState() => _CommunityModuleState();
}

class _CommunityModuleState extends State<CommunityModule> {
  bool isLoaded = false;
  final List<SingleCategory> cats = [];
  late Post recentPost;
  late Post hottestPost;
  final List<Category> justcats = [];

  void _addNewPost(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return SingleChildScrollView(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: NewPost(
                    cats: justcats as List<Category>,
                  ),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    void _handlePost(Post post) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => IndividualPost(post: post)));
    }

    void _handleCategory(Category cat) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryPosts(
                    category: cat,
                  )));
    }

    Future<void> initState() async {
      print('FETCHING...');
      final url =
          Uri.parse('https://flutterauthnectarfy.herokuapp.com/category');
      final hurl = Uri.parse('https://flutterauthnectarfy.herokuapp.com/post');
      try {
        final response = await http.get(url);
        final arrResponse = json.decode(response.body) as List<dynamic>;

        final response2 = await http.get(hurl);
        final arrResponse2 = json.decode(response2.body) as List<dynamic>;

        final featuredPosts = [];
        for (var post in arrResponse2) {
          List<dynamic> temp = post['likes'];
          List<String> likes = [];
          for (var like in temp) {
            likes.add(like['user']);
          }

          List<dynamic> temp2 = post['comments'];
          List<Comment> comments = [];
          for (var comment in temp2) {
            final User u =
                User(userId: comment['userId'], firstName: comment['username']);
            final Comment c = Comment(
                user: u,
                comment: comment['comment'],
                datePosted: DateTime.parse(comment['datePosted']));
            comments.add(c);
          }

          final User u =
              User(userId: post['user'], firstName: post['username']);
          final Post tempPost = Post(
              id: post['_id'],
              user: u,
              title: post['title'],
              description: post['description'],
              datePosted: DateTime.parse(post['datePosted']),
              categoryId: post['category'],
              likes: likes,
              comments: comments);

          featuredPosts.add(tempPost);
        }

        for (var element in arrResponse) {
          final Category temp = Category(
              id: element['_id'],
              title: element['title'],
              description: element['description']);
          justcats.add(temp);
          cats.add(SingleCategory(
            category: temp,
            onPressedFn: _handleCategory,
          ));
        }

        setState(() {
          isLoaded = true;
          recentPost = featuredPosts[0];
          hottestPost = featuredPosts[1];
        });
      } catch (error) {
        throw (error);
      }
    }

    isLoaded ? null : initState();

    print(cats.length);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Community"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: (mediaQuery.size.height * 1.5),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                // Community Board
                const CommunityBoard(),

                ElevatedButton(
                  child: const Text("Make New Post"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () => _addNewPost(context),
                ),

                const Padding(padding: EdgeInsets.only(bottom: 25)),

                // Hot post #1
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.5, right: 3.5),
                    child: Text('Recently posted',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),

                isLoaded
                    ? FeaturedPost(
                        post: recentPost,
                        onPressedFn: _handlePost,
                      )
                    : CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),

                const Padding(padding: EdgeInsets.only(bottom: 15)),

                // Hot post #2
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.5, right: 3.5),
                    child: Text('Hottest posts',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),

                isLoaded
                    ? FeaturedPost(
                        post: hottestPost,
                        onPressedFn: _handlePost,
                      )
                    : CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),

                const Padding(padding: EdgeInsets.only(bottom: 15)),

                // Categories
                // Categories(onPressedFn: _handleCategory),
                const Padding(
                  padding: EdgeInsets.only(bottom: 6, left: 5),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                !isLoaded
                    ? CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )
                    : Expanded(
                        child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: (2 / 1),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 5,
                          physics: const NeverScrollableScrollPhysics(),
                          children: cats,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
