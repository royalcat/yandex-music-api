import 'dart:convert';

import 'package:yandex_music_api/src/account/account.dart';
import 'package:yandex_music_api/src/account/permissions.dart';

import 'plus.dart';

class AccountStatus {
  final Account account;
  final Permissions permissions;
  final String advertisement;
  //final Subscription subscription;
  final int? cacheLimit;
  final bool subeditor;
  final int subeditorLevel;
  final Plus plus;
  final String defaultEmail;
  final int? skipsPerHour;
  final bool? stationExists;
  // final StationData stationData;
  //final Alert barBelow;
  AccountStatus({
    required this.account,
    required this.permissions,
    required this.advertisement,
    //required this.subscription,
    this.cacheLimit,
    required this.subeditor,
    required this.subeditorLevel,
    required this.plus,
    required this.defaultEmail,
    this.skipsPerHour,
    this.stationExists,
  });

  factory AccountStatus.fromMap(Map<String, dynamic> map) {
    return AccountStatus(
      account: Account.fromMap(map['account']),
      permissions: Permissions.fromMap(map['permissions']),
      advertisement: map['advertisement'],
      //subscription: Subscription.fromMap(map['subscription']),
      cacheLimit: map['cacheLimit'],
      subeditor: map['subeditor'],
      subeditorLevel: map['subeditorLevel'],
      plus: Plus.fromMap(map['plus']),
      defaultEmail: map['defaultEmail'],
      skipsPerHour: map['skipsPerHour'],
      stationExists: map['stationExists'],
    );
  }

  factory AccountStatus.fromJson(String source) =>
      AccountStatus.fromMap(json.decode(source));
}
