
late User currentUser;

class User {
  String? name;
  String? password;

  User({
    required this.name,
    required this.password,
  });

  // User.fromJson(Map<String, dynamic> json)
  //     : email = json['email'],
  //       password = json['password'];
  //
  // Map<String, dynamic> toJson() => {
  //       'kind': kind.toString(),
  //       'email': email,
  //       'password': password,
  //     };
}
