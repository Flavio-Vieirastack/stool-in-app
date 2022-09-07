
import '../../domain/entity/search_service_provider_query_entity.dart';

class SearchServiceProviderModel {
  final String query;
  final String pages;
  SearchServiceProviderModel({
    required this.query,
    required this.pages,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'search': query});
    result.addAll({'pages': pages});

    return result;
  }

  factory SearchServiceProviderModel.fromEntity({
    required SearchServiceProviderQueryEntity searchServiceProviderQueryEntity,
  }) {
    return SearchServiceProviderModel(
      pages: searchServiceProviderQueryEntity.pages,
      query: searchServiceProviderQueryEntity.query,
    );
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchServiceProviderModel && other.query == query;
  }

  @override
  int get hashCode => query.hashCode;
}
