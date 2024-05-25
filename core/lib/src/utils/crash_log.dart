class CrashLog {
  capture({required exception, StackTrace? stackTrace}) async {
    // final error = stackTrace ?? StackTrace.current;
    print('---------------------------------');
    print('Exception: $exception');
    print('---------------------------------');
    // await Future.wait([
    //   firebase.setError(exception: exception, stackTrace: error),
    // ]);
  }
}
