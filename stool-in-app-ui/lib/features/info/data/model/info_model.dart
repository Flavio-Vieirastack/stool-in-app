import 'dart:convert';

import 'package:stool_in/features/info/domain/entity/info_entity.dart';

class InfoModel extends InfoEntity {
  InfoModel({
    required super.id,
    required super.title,
    required super.body,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'titile': title});
    result.addAll({'body': body});

    return result;
  }

  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoModel.fromJson(String source) =>
      InfoModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InfoModel &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}
