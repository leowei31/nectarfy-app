import 'package:app/model/comment.dart';
import 'package:app/model/user.dart';
import 'package:flutter/material.dart';

class AddComment extends StatefulWidget {

  final Function onPressedFn;
  final Function closeModal;
  
  const AddComment({ Key? key, required this.onPressedFn, required this.closeModal }) : super(key: key);

  @override
  
  State<AddComment> createState() => _AddCommentState();
}



class _AddCommentState extends State<AddComment> {

  final commentController = TextEditingController();

  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {

    commentController.addListener(() {
      if(commentController.text.isEmpty) {
        setState(() {
          isEmpty = true;
        });
      } else {
        setState(() {
          isEmpty = false;
        });
      }
    }); 

    return  ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close)
                ),
                TextField(
                  autofocus: true,
                  controller: commentController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add a comment',
                    hintStyle: TextStyle(fontSize: 14)
                  ),
                  style: const TextStyle(fontSize: 14),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
                ElevatedButton(
                  onPressed: !isEmpty ? () {
                    final Comment c = Comment(
                      user: User(userId: '213', firstName: 'CHANGE LATER'), 
                      comment: commentController.value.text, 
                      datePosted: DateTime.now());

                    widget.onPressedFn(c);
                    widget.closeModal(context);
                  } : null, 
                  child: const Text('Reply', style: TextStyle(fontSize: 12)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}