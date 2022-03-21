import "package:flutter/material.dart";
// import 'package:intl/intl.dart';
import '../../model/category.dart';

class SingleCategory extends StatelessWidget {

  final Category category;
  final Function onPressedFn;
  
  const SingleCategory({ Key? key, required this.category, required this.onPressedFn }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          onPressedFn(category);
        },
        child: Card(
          color: Theme.of(context).primaryColor.withOpacity(0.60),
          elevation: 0,
          child: Center(child: Text(category.getTitle(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 12))),
        ),
      ),
    );
  }
}