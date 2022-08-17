import 'dart:convert';

import 'package:stool_in/features/info/domain/entity/info_entity.dart';

class InfoModel extends InfoEntity {
  InfoModel({
    required super.id,
    required super.titile,
    required super.body,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'titile': titile});
    result.addAll({'body': body});

    return result;
  }

  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      id: map['id']?.toInt() ?? 0,
      titile: map['titile'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoModel.fromJson(String source) =>
      InfoModel.fromMap(json.decode(source));
}
