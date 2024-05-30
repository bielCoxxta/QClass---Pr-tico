import 'package:core/core.dart';

abstract class IPackageInfoFailure implements ICustomFailure {
  IPackageInfoFailure({this.message, this.detailError, this.stackTrace});
  @override
  final String? message;
  @override
  final String? detailError;
  @override
  final StackTrace? stackTrace;
}

class FetchInfoAPPFailure extends IPackageInfoFailure {
  FetchInfoAPPFailure({this.error, this.detailsMessage});
  final String? error;
  final String? detailsMessage;

  @override
  String? get message => error;
}
