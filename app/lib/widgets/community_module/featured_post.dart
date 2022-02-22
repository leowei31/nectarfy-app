import "package:flutter/material.dart";

class FeaturedPost extends StatelessWidget {

  final String section;
  final String title;
  final String desc;

  const FeaturedPost({ Key? key, required this.section, required this.title, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 6, left: 5),
            child: Text(section, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Card(
              elevation: 0,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Image.asset('assets/images/sample_post.png', height: 90,),
                    ),
                    SizedBox(
                      width: 240,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                          Text(desc, style: const TextStyle(fontSize: 10, color: Colors.blueGrey),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}