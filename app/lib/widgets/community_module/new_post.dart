import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';
import '../../services/postservice.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);
  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _category = 'General';
  DateTime _time = DateTime.now();
  bool _canpost = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final _userid = context.watch<UserState>().userid;

    _titleController.addListener(() {
      if (_titleController.text.isEmpty) {
        setState(() {
          _canpost = false;
        });
      } else if (!_descriptionController.text.isEmpty) {
        setState(() {
          _canpost = true;
        });
      }
    });
    _descriptionController.addListener(() {
      if (_descriptionController.text.isEmpty) {
        setState(() {
          _canpost = false;
        });
      } else if (!_titleController.text.isEmpty) {
        setState(() {
          _canpost = true;
        });
      }
    });
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: mediaQuery.size.height * 0.9),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: TextField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Title',
                      contentPadding: EdgeInsets.all(20),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 5, // when user presses enter it will adapt to it
                    controller: _titleController,
                    onSubmitted: (_) {
                      print(_titleController);
                    },
                    onChanged: (_) {
                      print(_titleController);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.blueAccent)),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Details',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 10, //Normal textInputField will be displayed
                    maxLines: 20, // when user presses enter it will adapt to it
                    controller: _descriptionController,
                    onSubmitted: (_) {
                      print(_descriptionController);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton<String>(
                  value: _category,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                  items: <String>[
                    'General',
                    'Climate',
                    'Feeding',
                    'Varroa Mites'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: Text('Cancel'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton(
                      child: Text('Add Post'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      onPressed: _canpost
                          ? () {
                              PostService()
                                  .newPost(_titleController.text,
                                      _descriptionController.text, _userid)
                                  .then((val) {
                                if (val.data['success']) {
                                  print('success');
                                } else {
                                  print('yikes');
                                }
                              });
                              Navigator.pop(context);
                            }
                          : null,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
