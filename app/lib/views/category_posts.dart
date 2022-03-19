import 'package:flutter/material.dart';

import '../widgets/community_module/featured_post.dart';
import './individual_post.dart';

import '../model/category.dart';
import '../model/post.dart';
import '../model/user.dart';
import '../model/comment.dart';


class CategoryPosts extends StatelessWidget {

  static User currUser = User(userId: '123abc', firstName: 'Thiago', lastName: 'Lee');
  
  static Post post1 = Post(
    user: currUser, 
    title: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", 
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec tincidunt metus, vel sodales magna. Etiam vestibulum lacinia ultricies. Phasellus non aliquam est. Aenean id risus sed urna cursus rutrum. Vestibulum ex lectus, tempor in enim quis, pretium aliquam enim. Cras accumsan pulvinar ex et luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum aliquam libero at nulla volutpat, sit amet malesuada tellus hendrerit. Sed ornare finibus lacinia. Suspendisse congue imperdiet ante quis gravida. Morbi semper ipsum sit amet metus fermentum finibus sit amet et est. In finibus turpis eu pellentesque venenatis. \n \n Nunc eu sagittis nulla. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque iaculis, diam sed ullamcorper aliquam, purus nulla molestie urna, gravida consectetur enim dui a odio. Pellentesque malesuada tortor ac lectus euismod, eget efficitur tortor congue. Sed non quam nec purus bibendum mattis. Phasellus at risus porta, sagittis ipsum ac, placerat erat. Vivamus nunc felis, vehicula at fermentum in, placerat at purus. Donec tristique enim quis tellus finibus, sed molestie mi elementum.", 
    datePosted: DateTime.parse("2022-02-14 23:24:38"), 
    numOfLikes: 10, 
    comments: [
      Comment(user: currUser, comment: "Remy was not a joke.", datePosted: DateTime.parse("2022-03-18 23:26:38")),
      Comment(user: currUser, comment: "The fact that remy didn't win proves that the system is rigged and corrupt.", datePosted: DateTime.parse("2022-03-18 23:28:38")),
      Comment(user: currUser, comment: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", datePosted: DateTime.now()),
  ]);  
  static Post post2 = Post(
    user: currUser, 
    title: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", 
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec tincidunt metus, vel sodales magna. Etiam vestibulum lacinia ultricies. Phasellus non aliquam est. Aenean id risus sed urna cursus rutrum. Vestibulum ex lectus, tempor in enim quis, pretium aliquam enim. Cras accumsan pulvinar ex et luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum aliquam libero at nulla volutpat, sit amet malesuada tellus hendrerit. Sed ornare finibus lacinia. Suspendisse congue imperdiet ante quis gravida. Morbi semper ipsum sit amet metus fermentum finibus sit amet et est. In finibus turpis eu pellentesque venenatis. \n \n Nunc eu sagittis nulla. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque iaculis, diam sed ullamcorper aliquam, purus nulla molestie urna, gravida consectetur enim dui a odio. Pellentesque malesuada tortor ac lectus euismod, eget efficitur tortor congue. Sed non quam nec purus bibendum mattis. Phasellus at risus porta, sagittis ipsum ac, placerat erat. Vivamus nunc felis, vehicula at fermentum in, placerat at purus. Donec tristique enim quis tellus finibus, sed molestie mi elementum.", 
    datePosted: DateTime.parse("2022-02-14 23:24:38"), 
    numOfLikes: 10, 
    comments: [
      Comment(user: currUser, comment: "Remy was not a joke.", datePosted: DateTime.parse("2022-03-18 23:26:38")),
      Comment(user: currUser, comment: "The fact that remy didn't win proves that the system is rigged and corrupt.", datePosted: DateTime.parse("2022-03-18 23:28:38")),
      Comment(user: currUser, comment: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", datePosted: DateTime.now()),
  ]);  
  static Post post3 = Post(
    user: currUser, 
    title: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", 
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec tincidunt metus, vel sodales magna. Etiam vestibulum lacinia ultricies. Phasellus non aliquam est. Aenean id risus sed urna cursus rutrum. Vestibulum ex lectus, tempor in enim quis, pretium aliquam enim. Cras accumsan pulvinar ex et luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum aliquam libero at nulla volutpat, sit amet malesuada tellus hendrerit. Sed ornare finibus lacinia. Suspendisse congue imperdiet ante quis gravida. Morbi semper ipsum sit amet metus fermentum finibus sit amet et est. In finibus turpis eu pellentesque venenatis. \n \n Nunc eu sagittis nulla. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque iaculis, diam sed ullamcorper aliquam, purus nulla molestie urna, gravida consectetur enim dui a odio. Pellentesque malesuada tortor ac lectus euismod, eget efficitur tortor congue. Sed non quam nec purus bibendum mattis. Phasellus at risus porta, sagittis ipsum ac, placerat erat. Vivamus nunc felis, vehicula at fermentum in, placerat at purus. Donec tristique enim quis tellus finibus, sed molestie mi elementum.", 
    datePosted: DateTime.parse("2022-02-14 23:24:38"), 
    numOfLikes: 10, 
    comments: [
      Comment(user: currUser, comment: "Remy was not a joke.", datePosted: DateTime.parse("2022-03-18 23:26:38")),
      Comment(user: currUser, comment: "The fact that remy didn't win proves that the system is rigged and corrupt.", datePosted: DateTime.parse("2022-03-18 23:28:38")),
      Comment(user: currUser, comment: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", datePosted: DateTime.now()),
  ]);  
  static Post post4 = Post(
    user: currUser, 
    title: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", 
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec tincidunt metus, vel sodales magna. Etiam vestibulum lacinia ultricies. Phasellus non aliquam est. Aenean id risus sed urna cursus rutrum. Vestibulum ex lectus, tempor in enim quis, pretium aliquam enim. Cras accumsan pulvinar ex et luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum aliquam libero at nulla volutpat, sit amet malesuada tellus hendrerit. Sed ornare finibus lacinia. Suspendisse congue imperdiet ante quis gravida. Morbi semper ipsum sit amet metus fermentum finibus sit amet et est. In finibus turpis eu pellentesque venenatis. \n \n Nunc eu sagittis nulla. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque iaculis, diam sed ullamcorper aliquam, purus nulla molestie urna, gravida consectetur enim dui a odio. Pellentesque malesuada tortor ac lectus euismod, eget efficitur tortor congue. Sed non quam nec purus bibendum mattis. Phasellus at risus porta, sagittis ipsum ac, placerat erat. Vivamus nunc felis, vehicula at fermentum in, placerat at purus. Donec tristique enim quis tellus finibus, sed molestie mi elementum.", 
    datePosted: DateTime.parse("2022-02-14 23:24:38"), 
    numOfLikes: 10, 
    comments: [
      Comment(user: currUser, comment: "Remy was not a joke.", datePosted: DateTime.parse("2022-03-18 23:26:38")),
      Comment(user: currUser, comment: "The fact that remy didn't win proves that the system is rigged and corrupt.", datePosted: DateTime.parse("2022-03-18 23:28:38")),
      Comment(user: currUser, comment: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", datePosted: DateTime.now()),
  ]);  
  static Post post5 = Post(
    user: currUser, 
    title: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", 
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec tincidunt metus, vel sodales magna. Etiam vestibulum lacinia ultricies. Phasellus non aliquam est. Aenean id risus sed urna cursus rutrum. Vestibulum ex lectus, tempor in enim quis, pretium aliquam enim. Cras accumsan pulvinar ex et luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum aliquam libero at nulla volutpat, sit amet malesuada tellus hendrerit. Sed ornare finibus lacinia. Suspendisse congue imperdiet ante quis gravida. Morbi semper ipsum sit amet metus fermentum finibus sit amet et est. In finibus turpis eu pellentesque venenatis. \n \n Nunc eu sagittis nulla. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque iaculis, diam sed ullamcorper aliquam, purus nulla molestie urna, gravida consectetur enim dui a odio. Pellentesque malesuada tortor ac lectus euismod, eget efficitur tortor congue. Sed non quam nec purus bibendum mattis. Phasellus at risus porta, sagittis ipsum ac, placerat erat. Vivamus nunc felis, vehicula at fermentum in, placerat at purus. Donec tristique enim quis tellus finibus, sed molestie mi elementum.", 
    datePosted: DateTime.parse("2022-02-14 23:24:38"), 
    numOfLikes: 10, 
    comments: [
      Comment(user: currUser, comment: "Remy was not a joke.", datePosted: DateTime.parse("2022-03-18 23:26:38")),
      Comment(user: currUser, comment: "The fact that remy didn't win proves that the system is rigged and corrupt.", datePosted: DateTime.parse("2022-03-18 23:28:38")),
      Comment(user: currUser, comment: "O que vocês gostariam de encontrar numa consultoria de investimentos/finanças pessoais? Estou estruturando uma e respeito bastante a opinião do sub, gostaria de saber mais.", datePosted: DateTime.now()),
  ]);  
  

  Category category = Category(
    title: "Nectarfy Hives", 
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec tincidunt metus, vel sodales magna. Etiam vestibulum lacinia ultricies. Phasellus non aliquam est. Aenean id risus sed urna cursus rutrum. Vestibulum ex lectus, tempor in enim quis, pretium aliquam enim.", 
    posts: [post1, post2, post3, post4, post5]
  );

  CategoryPosts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _handlePost() {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const IndividualPost())
      );
    }

    Widget getPostsWidgets(List<Post> posts) {
      List<Widget> list = <Widget>[];
      for(int i = 0; i < posts.length; i++){
        list.add(FeaturedPost(post: posts[i], onPressedFn: _handlePost,));
      }
      return Column(children: list);
    }

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
              Text(category.getTitle(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const Padding(padding: EdgeInsets.only(bottom: 25.0)),
              
              Text('${category.getPosts().length} post(s)', style: TextStyle(color: Colors.grey.withOpacity(0.95)),),
              const Padding(padding: EdgeInsets.only(bottom: 4.0)),
      
              Text(category.getDescription()),
              const Padding(padding: EdgeInsets.only(bottom: 25.0)),
              
              const Text("All posts", style: TextStyle(fontWeight: FontWeight.bold),),
              const Padding(padding: EdgeInsets.only(bottom: 25.0)),
              getPostsWidgets(category.getPosts()),
            ],
          )
        ),
      )
    );
  }
}