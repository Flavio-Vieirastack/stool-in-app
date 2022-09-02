import 'dart:convert';

import '../../../../../exports/app_exports.dart';

class ComentsModel extends ComentsEntity {
  ComentsModel({
    super.id,
    super.coment,
    super.userName,
    super.userPhotoUrl,
    super.vote,
    super.servicesExecuted,
    super.serviceProviderId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (coment != null) {
      result.addAll({'coment': coment});
    }
    if (userName != null) {
      result.addAll({'userName': userName});
    }
    if (userPhotoUrl != null) {
      result.addAll({'userPhotoUrl': userPhotoUrl});
    }
    if (vote != null) {
      result.addAll({'vote': vote});
    }
    if (servicesExecuted != null) {
      result.addAll({'serviceExecuted': servicesExecuted});
    }
    if (servicesExecuted != null) {
      result.addAll({'serviceProviderId': serviceProviderId});
    }

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

  factory ComentsModel.fromEntity({required ComentsEntity comentsEntity}) {
    return ComentsModel(
      coment: comentsEntity.coment,
      id: comentsEntity.id,
      serviceProviderId: comentsEntity.serviceProviderId,
      servicesExecuted: comentsEntity.servicesExecuted,
      userName: comentsEntity.userName,
      userPhotoUrl: comentsEntity.userPhotoUrl,
      vote: comentsEntity.vote,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComentsModel.fromJson(String source) =>
      ComentsModel.fromMap(json.decode(source));
}
