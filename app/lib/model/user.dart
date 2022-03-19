import 'package:flutter/material.dart';

class User {

  final String userId;
  final String firstName;
  final String lastName;
  final Image profilePic = Image.asset('assets/images/no_profile_pic.png', height: 200,);

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    
  });

  String getUserId() => userId;
  String getFirstName() => firstName;
  String getLastName() => lastName;
  Image getProfilePic() => profilePic;
}
