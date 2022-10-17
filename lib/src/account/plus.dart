import 'dart:convert';

class Plus {
  final bool hasPlus;
  final bool isTutorialCompleted;
  Plus({
    required this.hasPlus,
    required this.isTutorialCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'hasPlus': hasPlus,
      'isTutorialCompleted': isTutorialCompleted,
    };
  }

  factory Plus.fromMap(Map<String, dynamic> map) {
    return Plus(
      hasPlus: map['hasPlus'],
      isTutorialCompleted: map['isTutorialCompleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Plus.fromJson(String source) => Plus.fromMap(json.decode(source));
}
