import 'package:flutter/material.dart';

import '../model/category.dart';

class CategoryPosts extends StatelessWidget {

  Category category = Category(
    title: "Nectarfy Hives", 
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec tincidunt metus, vel sodales magna. Etiam vestibulum lacinia ultricies. Phasellus non aliquam est. Aenean id risus sed urna cursus rutrum. Vestibulum ex lectus, tempor in enim quis, pretium aliquam enim.", 
    posts: []
  );

  CategoryPosts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
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
          ],
        )
      )
    );
  }
}