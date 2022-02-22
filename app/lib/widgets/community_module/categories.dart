import "package:flutter/material.dart";

import "./single_category.dart";

class Categories extends StatelessWidget {
  
  const Categories({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const SingleCategory temp  = SingleCategory(title: "Nectarfy hives");
    const SingleCategory temp2 = SingleCategory(title: "Extract honey");

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 6, left: 5),
            child: Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: (2 / 1),
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              children: const <Widget> [temp, temp2, temp, temp, temp, temp,temp, temp2, temp, temp, temp, temp,temp, temp2, temp, temp, temp, temp],
            ),
          ),
        ],
      ),
    );
  }
}