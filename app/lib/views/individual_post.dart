import 'package:flutter/material.dart';

import '../widgets/individual_post/user_info_header.dart';
import '../widgets/individual_post/likes_comments_info.dart';
import '../model/user.dart';
import '../model/post.dart';
import '../model/comment.dart';

class IndividualPost extends StatelessWidget {  
  
  const IndividualPost({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // delete this later
    final User currUser = User(userId: '123abc', firstName: 'Thiago', lastName: 'Lee');
    final Post currPost = Post(
      user: currUser, 
      title: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", 
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec tincidunt metus, vel sodales magna. Etiam vestibulum lacinia ultricies. Phasellus non aliquam est. Aenean id risus sed urna cursus rutrum. Vestibulum ex lectus, tempor in enim quis, pretium aliquam enim. Cras accumsan pulvinar ex et luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum aliquam libero at nulla volutpat, sit amet malesuada tellus hendrerit. Sed ornare finibus lacinia. Suspendisse congue imperdiet ante quis gravida. Morbi semper ipsum sit amet metus fermentum finibus sit amet et est. In finibus turpis eu pellentesque venenatis. \n \n Nunc eu sagittis nulla. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque iaculis, diam sed ullamcorper aliquam, purus nulla molestie urna, gravida consectetur enim dui a odio. Pellentesque malesuada tortor ac lectus euismod, eget efficitur tortor congue. Sed non quam nec purus bibendum mattis. Phasellus at risus porta, sagittis ipsum ac, placerat erat. Vivamus nunc felis, vehicula at fermentum in, placerat at purus. Donec tristique enim quis tellus finibus, sed molestie mi elementum.", 
      datePosted: DateTime.now(), 
      numOfLikes: 10, 
      comments: [
        Comment(user: currUser, comment: "Remy was not a joke."),
        Comment(user: currUser, comment: "The fact that remy didn't win proves that the system is rigged and corrupt."),
        Comment(user: currUser, comment: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais."),
      ]);

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
              children: <Widget>[
                UserInfoHeader(user: currUser, datePosted: currPost.getDatePosted()),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(currPost.getTitle(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                Text(currPost.getDescription(), style: const TextStyle(fontSize: 14)),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                LikesCommentsInfo(numOfLikes: currPost.numOfLikes, numOfComments: currPost.comments.length),
                const Text("comments"),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}