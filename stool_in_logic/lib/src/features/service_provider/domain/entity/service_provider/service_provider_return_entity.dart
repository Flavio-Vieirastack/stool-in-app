


import 'create_and_update_service_provider_entity.dart';

class ServiceProviderReturnEntity extends CreateAndUpdateServiceProviderEntity {
  final int id;
  final int userLoginId;
  final DateTime createdAt;
  ServiceProviderReturnEntity({
    required this.id,
    required this.userLoginId,
    required this.createdAt,
    required super.disponibleDays,
    required super.endDisponibleTime,
    required super.initialDisponibleTime,
    required super.status,
    required super.userDescription,
    required super.votes,
    required super.coins,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ServiceProviderReturnEntity &&
      other.id == id &&
      other.userLoginId == userLoginId &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ userLoginId.hashCode ^ createdAt.hashCode;
}
