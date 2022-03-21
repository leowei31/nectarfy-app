import 'package:app/model/user.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/individual_post/user_info_header.dart';
import '../widgets/individual_post/likes_comments_info.dart';
import '../widgets/individual_post/comment_card.dart';
import '../widgets/individual_post/add_comment.dart';
import '../model/post.dart';
import '../model/comment.dart'; 

class IndividualPost extends StatefulWidget {  
  final Post post;
  
  const IndividualPost({ Key? key, required this.post }) : super(key: key);

  @override
  State<IndividualPost> createState() => _IndividualPostState();
}

class _IndividualPostState extends State<IndividualPost> {

  final User user = User(userId: "6236a14d7ddcde79c9006d4c", firstName: "Thiago");
  bool isLiked = false;
  bool initialState = true;
  bool newCommentState = false;
  List<Widget> list = <Widget>[];

  @override
  Widget build(BuildContext context) {

    void _initialState() {
      for(int i = 0; i < widget.post.comments.length; i++) {
        list.add(CommentCard(comment: widget.post.comments[i]));
      }

      bool liked = widget.post.getLikes().contains(user.getUserId());

      setState(() {
        initialState = false;
        isLiked = liked;
      });
    }

    void _handleSubmitComment(Comment comment) async {

      try {

        final url = Uri.parse('https://flutterauthnectarfy.herokuapp.com/post/comment/${widget.post.getId()}');
        final headers = <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          };
        final body = jsonEncode(<String, String>{
          'userId': user.getUserId(),
          'comment': comment.getComment(),
          'datePosted': comment.getDatePosted().toString(),
        });
        await http.post(url, headers: headers, body: body);
        list.add(CommentCard(comment: comment));
        widget.post.getComments().add(comment);

      } catch(error) {
        rethrow;
      }

      setState(() {
        newCommentState = !newCommentState;
      });
    }

    void _handleCloseModal(BuildContext context) {
      Navigator.pop(context);
    }

    void _handleAddComment(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return AddComment(onPressedFn: _handleSubmitComment, closeModal: _handleCloseModal);
        });
    }

    void _handleLikeButton() async {
      
      if (isLiked) {
        final url = Uri.parse('https://flutterauthnectarfy.herokuapp.com/post/unlike/${widget.post.getId()}');
        final headers = <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          };
        final body = jsonEncode(<String, String>{
          'userId': user.getUserId(),
        });
        try {
          final response = await http.put(url, headers: headers, body: body);
        } catch (error) {
          rethrow;
        }

        widget.post.getLikes().remove(user.getUserId());
      } else {
        final url = Uri.parse('https://flutterauthnectarfy.herokuapp.com/post/like/${widget.post.getId()}');
        final headers = <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          };
        final body = jsonEncode(<String, String>{
          'userId': user.getUserId(),
        });

        try {
          final response = await http.put(url, headers: headers, body: body);
        } catch (error) {
          rethrow;
        }

        widget.post.getLikes().add(user.getUserId());
      }

      setState(() {
        isLiked = !isLiked;
      });
    }

    initialState ? _initialState() : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Community"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UserInfoHeader(user: widget.post.user, datePosted: widget.post.getDatePosted()),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(widget.post.getTitle(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                Text(widget.post.getDescription(), style: const TextStyle(fontSize: 14)),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                LikesCommentsInfo(numOfLikes: widget.post.likes.length, numOfComments: list.length, isLiked: isLiked, onPressedFn: _handleLikeButton,),
                const Padding(padding: EdgeInsets.only(bottom: 25)),

                //COMMENT SECTION
                const Text("Comments", style: TextStyle(fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Column(children: list,)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.rate_review_outlined),
        onPressed: () => _handleAddComment(context),
      )
    );
  }
}