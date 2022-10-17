import 'dart:convert';

class Cover {
  String type;
  String uri;
  String? itemsUri;
  String dir;
  String version;
  bool isCustom;
  String? prefix;
  String? copyrightName;
  String? copyrightCline;
  String? error;
  Cover({
    required this.type,
    required this.uri,
    required this.itemsUri,
    required this.dir,
    required this.version,
    required this.isCustom,
    required this.prefix,
    required this.copyrightName,
    required this.copyrightCline,
    required this.error,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'uri': uri,
      'itemsUri': itemsUri,
      'dir': dir,
      'version': version,
      'isCustom': isCustom,
      'prefix': prefix,
      'copyrightName': copyrightName,
      'copyrightCline': copyrightCline,
      'error': error,
    };
  }

  factory Cover.fromMap(Map<String, dynamic> map) {
    return Cover(
      type: map['type'],
      uri: map['uri'],
      itemsUri: map['itemsUri'],
      dir: map['dir'],
      version: map['version'],
      isCustom: map['isCustom'] ?? map['custom'],
      prefix: map['prefix'],
      copyrightName: map['copyrightName'],
      copyrightCline: map['copyrightCline'],
      error: map['error'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cover.fromJson(String source) => Cover.fromMap(json.decode(source));
}
