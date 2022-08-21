class CacheUserActionsHelper {
  final bool userPassBySplashPage;
  final bool userGetHomeData;
  final bool userGetDoubtsData;
  final bool userGetRulesData;
  CacheUserActionsHelper({
    required this.userPassBySplashPage,
    required this.userGetHomeData,
    required this.userGetDoubtsData,
    required this.userGetRulesData,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CacheUserActionsHelper &&
      other.userPassBySplashPage == userPassBySplashPage &&
      other.userGetHomeData == userGetHomeData &&
      other.userGetDoubtsData == userGetDoubtsData &&
      other.userGetRulesData == userGetRulesData;
  }

  @override
  int get hashCode {
    return userPassBySplashPage.hashCode ^
      userGetHomeData.hashCode ^
      userGetDoubtsData.hashCode ^
      userGetRulesData.hashCode;
  }

  @override
  String toString() {
    return 'CacheUserActionsHelper(userPassBySplashPage: $userPassBySplashPage, userGetHomeData: $userGetHomeData, userGetDoubtsData: $userGetDoubtsData, userGetRulesData: $userGetRulesData)';
  }

  CacheUserActionsHelper copyWith({
    bool? userPassBySplashPage,
    bool? userGetHomeData,
    bool? userGetDoubtsData,
    bool? userGetRulesData,
  }) {
    return CacheUserActionsHelper(
      userPassBySplashPage: userPassBySplashPage ?? this.userPassBySplashPage,
      userGetHomeData: userGetHomeData ?? this.userGetHomeData,
      userGetDoubtsData: userGetDoubtsData ?? this.userGetDoubtsData,
      userGetRulesData: userGetRulesData ?? this.userGetRulesData,
    );
  }
}
