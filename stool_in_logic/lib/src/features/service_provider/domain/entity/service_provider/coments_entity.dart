class ComentsEntity {
  final int id;
  final String coment;
  final String userName;
  final String userPhotoUrl;
  final int vote;
  final int userId;
  final String serviceExecuted;
  final int serviceProviderId;
  ComentsEntity({
    required this.id,
    required this.coment,
    required this.userName,
    required this.userPhotoUrl,
    required this.vote,
    required this.userId,
    required this.serviceExecuted,
    required this.serviceProviderId,
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
      other.userId == userId &&
      other.serviceExecuted == serviceExecuted &&
      other.serviceProviderId == serviceProviderId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      coment.hashCode ^
      userName.hashCode ^
      userPhotoUrl.hashCode ^
      vote.hashCode ^
      userId.hashCode ^
      serviceExecuted.hashCode ^
      serviceProviderId.hashCode;
  }
}
