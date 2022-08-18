class CreateServiceProviderEntity {
  final int? id;
  final String userDescription;
  final int votes;
  final String status;
  final DateTime initialDisponibleTime;
  final DateTime endDisponibleTime;
  final String disponibleDays;
  CreateServiceProviderEntity({
    this.id,
    required this.userDescription,
    required this.votes,
    required this.status,
    required this.initialDisponibleTime,
    required this.endDisponibleTime,
    required this.disponibleDays,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateServiceProviderEntity &&
        other.id == id &&
        other.userDescription == userDescription &&
        other.votes == votes &&
        other.status == status &&
        other.initialDisponibleTime == initialDisponibleTime &&
        other.endDisponibleTime == endDisponibleTime &&
        other.disponibleDays == disponibleDays;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userDescription.hashCode ^
        votes.hashCode ^
        status.hashCode ^
        initialDisponibleTime.hashCode ^
        endDisponibleTime.hashCode ^
        disponibleDays.hashCode;
  }
}
