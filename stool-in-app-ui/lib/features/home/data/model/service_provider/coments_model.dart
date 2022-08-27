import 'dart:convert';

import '../../../export/home_export.dart';




class ComentsModel extends ComentsEntity {
  
  ComentsModel({
    required super.id,
    required super.coment,
    required super.userName,
    required super.userPhotoUrl,
    required super.vote,
    required super.servicesExecuted,
    required super.serviceProviderId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'coment': coment});
    result.addAll({'userName': userName});
    result.addAll({'userPhotoUrl': userPhotoUrl});
    result.addAll({'vote': vote});
    result.addAll({'serviceExecuted': servicesExecuted});
    result.addAll({'serviceProviderId': serviceProviderId});
  
    return result;
  }

  factory ComentsModel.fromMap(Map<String, dynamic> map) {
    return ComentsModel(
      id: map['id']?.toInt() ?? 0,
      coment: map['coment'] ?? '',
      userName: map['userName'] ?? '',
      userPhotoUrl: map['userPhotoUrl'] ?? '',
      vote: map['vote']?.toInt() ?? 0,
      servicesExecuted: map['serviceExecuted'] ?? '',
      serviceProviderId: map['serviceProviderId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComentsModel.fromJson(String source) => ComentsModel.fromMap(json.decode(source));
}
