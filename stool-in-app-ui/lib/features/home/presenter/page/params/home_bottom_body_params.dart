
import 'package:stool_in_logic/stool_in_logic.dart';

class HomeBottomBodyParams {
  final List<CategoriesEntity> categoriesEntity;
  final List<ServiceProviderEntity> serviceProviderEntity;
  HomeBottomBodyParams({
    required this.categoriesEntity,
    required this.serviceProviderEntity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HomeBottomBodyParams &&
      other.categoriesEntity == categoriesEntity &&
      other.serviceProviderEntity == serviceProviderEntity;
  }

  @override
  int get hashCode => categoriesEntity.hashCode ^ serviceProviderEntity.hashCode;
}
