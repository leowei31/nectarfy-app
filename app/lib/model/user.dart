class User {
  final String userId;
  final String firstName;
  final String lastName;
  // Image profilePic = ;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    // this.profilePic,
  });

  String getUserId() => userId;
  String getFirstName() => firstName;
  String getLastName() => lastName;
}
