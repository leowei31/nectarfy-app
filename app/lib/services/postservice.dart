import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostService {
  Dio dio = new Dio();

  newPost(title, description, userid, categoryid) async {
    try {
      return await dio.post('https://flutterauthnectarfy.herokuapp.com/post',
          data: {
            'user': '${userid}',
            'title': title,
            'description': description,
            'datePosted': '${DateTime.now()}',
            'category': '${categoryid}',
            'likes': [],
            'comments': []
          },
          options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      print(e);
    }
  }
}
