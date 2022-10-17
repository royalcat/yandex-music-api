import 'dart:convert';

class Permissions {
  final DateTime until;
  final List<String> values;
  final List<String> defaultValues;
  Permissions({
    required this.until,
    required this.values,
    required this.defaultValues,
  });

  factory Permissions.fromMap(Map<String, dynamic> map) {
    return Permissions(
      until: DateTime.parse(map['until']),
      values: List<String>.from(map['values']),
      defaultValues: List<String>.from(map['default']),
    );
  }

  factory Permissions.fromJson(String source) =>
      Permissions.fromMap(json.decode(source));
}
