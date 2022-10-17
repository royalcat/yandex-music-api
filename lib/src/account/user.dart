import 'dart:convert';

class User {
  final int uid;
  final String login;
  final String name;
  final String? displayName;
  final String? fullName;
  final String sex;
  final bool verified;
  final List<int>? regions;
  User({
    required this.uid,
    required this.login,
    required this.name,
    this.displayName,
    this.fullName,
    required this.sex,
    required this.verified,
    this.regions,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      login: map['login'],
      name: map['name'],
      displayName: map['displayName'],
      fullName: map['fullName'],
      sex: map['sex'],
      verified: map['verified'],
      regions: map['regions'] == null ? null : List<int>.from(map['regions']),
    );
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
