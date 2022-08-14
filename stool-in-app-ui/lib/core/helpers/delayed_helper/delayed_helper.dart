class DelayedHelper {
  static delay({
    required int seconds,
    required Function function,
  }) async {
    await Future.delayed(
      Duration(seconds: seconds),
      () async => function.call(),
    );
  }
}
