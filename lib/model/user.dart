enum MessageKind {
  Login,
  Register,
}

class User {
  String email;
  String password;
  MessageKind kind;
  

  User(this.kind, {this.email, this.password});

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() =>
      {
        'kind': kind.toString(),
        'email': email,
        'password': password,
      };
}
