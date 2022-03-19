import "package:flutter/material.dart";

class CommunityBoard extends StatefulWidget {
  const CommunityBoard({Key? key}) : super(key: key);

  @override
  _CommunityBoardState createState() => _CommunityBoardState();
}

class _CommunityBoardState extends State<CommunityBoard> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    const String _communityBoardTitle = "Community Board";
    const _communityBoardDesc =
        "Welcome to the community boad! Connect with industry leading experts and your friendly neighborhood beekeepers";

    var searchController = TextEditingController();

    void _searchHandler() {
      print(searchController.value.text);
    }

    return SizedBox(
        width: double.infinity,
        height: media.size.height * 0.23,
        child: Card(
          color: Theme.of(context).primaryColor,
          elevation: 0,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: const Text(_communityBoardTitle,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const Text(_communityBoardDesc,
                        style: TextStyle(fontSize: 12))),
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: searchController,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 10, right: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(fontSize: 12),
                      hintText: "Search Community",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: _searchHandler,
                        iconSize: 22,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
