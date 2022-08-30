// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/profile/domain/entity/services_contracted_entity.dart';

class UserDataUniqueEntity extends UserDataEntity {
  final List<ServicesContractedEntity> servicesContacted;
  UserDataUniqueEntity({
    required this.servicesContacted,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is UserDataUniqueEntity &&
      listEquals(other.servicesContacted, servicesContacted);
  }

  @override
  int get hashCode => servicesContacted.hashCode;
}
