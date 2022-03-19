import 'package:flutter/material.dart';

import '../widgets/community_module/community_board.dart';
import '../widgets/community_module/featured_post.dart';
import '../widgets/community_module/categories.dart';
import './individual_post.dart';

class CommunityModule extends StatelessWidget {
  const CommunityModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appbarHeight = AppBar().preferredSize.height;

    void _handlePost(String title, String description) {
      print('Title: $title');
      print('Description: $description');

      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const IndividualPost())
      );
    }

    void _handleCategory(String title) {
      print(title);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Community"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: (mediaQuery.size.height -
              appbarHeight -
              mediaQuery.padding.top -
              mediaQuery.padding.bottom),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                // Community Board
                const CommunityBoard(),

                const Padding(padding: EdgeInsets.only(bottom: 25)),

                // Hot post #1
                FeaturedPost(
                  section: "Recently created post",
                  title: "What method have you guys found to be the most...",
                  desc: "As per the title, what method have you guys found to be the most effective when fighting a Varroa Mite infestation?",
                  onPressedFn: _handlePost,
                ),

                const Padding(padding: EdgeInsets.only(bottom: 15)),

                // Hot post #2
                FeaturedPost(
                    section: "Hottest post",
                    title: "What method have you guys found to be the most...",
                    desc:
                        "As per the title, what method have you guys found to be the most effective when fighting a Varroa Mite infestation?",
                    onPressedFn: _handlePost,
                ),

                const Padding(padding: EdgeInsets.only(bottom: 15)),

                // Categories
                Categories(onPressedFn: _handleCategory),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
