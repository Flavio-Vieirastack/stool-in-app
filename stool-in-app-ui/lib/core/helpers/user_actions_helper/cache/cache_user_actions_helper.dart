import 'dart:developer';

class CacheUserActionsHelper {
  final bool userPassBySplashPage;
  final bool userGetHomeData;
  final bool userGetDoubtsData;
  final bool userGetRulesData;
  CacheUserActionsHelper({
    this.userPassBySplashPage = false,
    this.userGetHomeData = false,
    this.userGetDoubtsData = false,
    this.userGetRulesData = false,
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
    final result = CacheUserActionsHelper(
      userPassBySplashPage: userPassBySplashPage ?? this.userPassBySplashPage,
      userGetHomeData: userGetHomeData ?? this.userGetHomeData,
      userGetDoubtsData: userGetDoubtsData ?? this.userGetDoubtsData,
      userGetRulesData: userGetRulesData ?? this.userGetRulesData,
    );
    log(result.toString());
    return result;
  }
}
