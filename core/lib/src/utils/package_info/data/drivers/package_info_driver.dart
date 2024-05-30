import 'package:core/core.dart';

import '../../domain/failures/package_info_failure.dart';

class PackageInfoDriver extends IPackageInfoDriver {
  PackageInfoDriver({required this.crashLog});
  final CrashLog crashLog;

  @override
  Future<Either<IPackageInfoFailure, PackageInfoEntity>> fetchAppInfo() async {
    try {
      final info = await PackageInfo.fromPlatform();
      return Right(
        PackageInfoEntity(
          appName: info.appName,
          name: info.packageName,
          version: info.version,
          buildNumber: int.tryParse(info.buildNumber) ?? 0,
          buildSignature: info.buildSignature,
          forceUpdate: false,
        ),
      );
    } catch (exception, stack) {
      crashLog.capture(exception: exception, stackTrace: stack);
      return Left(FetchInfoAPPFailure(error: 'Falha ao pegar dados do APP'));
    }
  }
}
