class ComentsEntity {
  final int? id;
  final String? coment;
  final String? userName;
  final String? userPhotoUrl;
  final int? vote;
  final String? servicesExecuted;
  final int? serviceProviderId;
  ComentsEntity({
    this.id,
    this.coment,
    this.userName,
    this.userPhotoUrl,
    this.vote,
    this.servicesExecuted,
    this.serviceProviderId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComentsEntity &&
        other.id == id &&
        other.coment == coment &&
        other.userName == userName &&
        other.userPhotoUrl == userPhotoUrl &&
        other.vote == vote &&
        other.servicesExecuted == servicesExecuted &&
        other.serviceProviderId == serviceProviderId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        coment.hashCode ^
        userName.hashCode ^
        userPhotoUrl.hashCode ^
        vote.hashCode ^
        servicesExecuted.hashCode ^
        serviceProviderId.hashCode;
  }
}
