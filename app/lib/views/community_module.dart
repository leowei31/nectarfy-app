import 'package:flutter/material.dart';

import '../widgets/community_module/community_board.dart';
import '../widgets/community_module/featured_post.dart';
import '../widgets/community_module/categories.dart';
import '../widgets/community_module/new_post.dart';
import "../widgets/community_module/single_category.dart";

class CommunityModule extends StatelessWidget {
  const CommunityModule({Key? key}) : super(key: key);
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
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: NewPost(),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appbarHeight = AppBar().preferredSize.height;

    void _handlePost(String title, String description) {
      print('Title: $title');
      print('Description: $description');
    }

    void _handleCategory(String title) {
      print(title);
    }

    SingleCategory temp =
        SingleCategory(title: "Nectarfy hives", onPressedFn: _handleCategory);
    SingleCategory temp2 = SingleCategory(
      title: "Extract honey",
      onPressedFn: _handleCategory,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Community"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: (mediaQuery.size.height * 1.2),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                // Community Board
                const CommunityBoard(),

                ElevatedButton(
                  child: Text("Make New Post"),
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
                FeaturedPost(
                  section: "Recently created post",
                  title: "What method have you guys found to be the most...",
                  desc:
                      "As per the title, what method have you guys found to be the most effective when fighting a Varroa Mite infestation?",
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
                // Categories(onPressedFn: _handleCategory),
                const Padding(
                  padding: EdgeInsets.only(bottom: 6, left: 5),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: (2 / 1),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      temp,
                      temp2,
                      temp,
                      temp,
                      temp,
                      temp,
                      temp,
                      temp2,
                      temp,
                      temp,
                      temp,
                      temp,
                      temp,
                      temp2,
                      temp,
                      temp,
                      temp,
                      temp
                    ],
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
