class CreateAndUpdateServiceProviderEntity {
  final String? userDescription;
  final int? votes;
  final String? status;
  final DateTime? initialDisponibleTime;
  final DateTime? endDisponibleTime;
  final String? disponibleDays;
  CreateAndUpdateServiceProviderEntity({
    this.userDescription,
    this.votes,
    this.status,
    this.initialDisponibleTime,
    this.endDisponibleTime,
    this.disponibleDays,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateAndUpdateServiceProviderEntity &&
        other.userDescription == userDescription &&
        other.votes == votes &&
        other.status == status &&
        other.initialDisponibleTime == initialDisponibleTime &&
        other.endDisponibleTime == endDisponibleTime &&
        other.disponibleDays == disponibleDays;
  }

  @override
  int get hashCode {
    return userDescription.hashCode ^
        votes.hashCode ^
        status.hashCode ^
        initialDisponibleTime.hashCode ^
        endDisponibleTime.hashCode ^
        disponibleDays.hashCode;
  }
}
