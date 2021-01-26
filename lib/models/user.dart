class User{
  int id;
  String username;
  String name;
  String email;

  User({this.id, this.username, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      email: json['email']
    );
  }

}