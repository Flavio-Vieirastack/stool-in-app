import 'dart:convert';

import '../../../../../exports/app_exports.dart';


class CategoriesModel extends CategoriesEntity {
  CategoriesModel({
    required super.id,
    required super.categoryName,
    required super.searchQuery,
    required super.lottieUrl,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesModel &&
        other.id == id &&
        other.categoryName == categoryName &&
        other.searchQuery == searchQuery;
  }

  @override
  int get hashCode =>
      id.hashCode ^ categoryName.hashCode ^ searchQuery.hashCode;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'categoryName': categoryName});
    result.addAll({'searchQuery': searchQuery});
    result.addAll({'lottieUrl': lottieUrl});

    return result;
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id']?.toInt() ?? 0,
      categoryName: map['categoryName'] ?? '',
      searchQuery: map['searchQuery'] ?? '',
      lottieUrl: map['lottieUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source));
}
