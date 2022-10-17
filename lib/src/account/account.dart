import 'dart:convert';

class Account {
  final DateTime now;
  final int uid;
  final String? login;
  final String? fullName;
  final String? secondName;
  final String? firstName;
  final String? displayName;
  final DateTime? birthday;
  final bool? serviceAvailable;
  final bool? hostedUser;
  final int? region;
  //final List<PassportPhones> passportPhones
  final DateTime? registeredAt;
  final bool? hasInfoForAppMetrica;
  Account({
    required this.now,
    required this.uid,
    this.login,
    this.fullName,
    this.secondName,
    this.firstName,
    this.displayName,
    this.birthday,
    this.serviceAvailable,
    this.hostedUser,
    this.region,
    this.registeredAt,
    this.hasInfoForAppMetrica,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      now: DateTime.parse(map['now']),
      uid: map['uid'],
      login: map['login'],
      fullName: map['fullName'],
      secondName: map['secondName'],
      firstName: map['firstName'],
      displayName: map['displayName'],
      birthday: DateTime.parse(map['birthday']),
      serviceAvailable: map['serviceAvailable'],
      hostedUser: map['hostedUser'],
      region: map['region'],
      registeredAt: DateTime.parse(map['registeredAt']),
      hasInfoForAppMetrica: map['hasInfoForAppMetrica'],
    );
  }

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));
}
