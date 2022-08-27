import 'package:stool_in/exports/app_exports.dart';

class SearchServiceProviderModel {
  final String query;
  SearchServiceProviderModel({
    required this.query,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchServiceProviderModel && other.query == query;
  }

  @override
  int get hashCode => query.hashCode;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'search': query});

    return result;
  }

  factory SearchServiceProviderModel.fromEntity({
    required SearchServiceProviderQueryEntity searchServiceProviderQueryEntity,
  }) {
    return SearchServiceProviderModel(
      query: searchServiceProviderQueryEntity.query,
    );
  }
}
