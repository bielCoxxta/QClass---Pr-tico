import 'package:core/src/utils/package_info/domain/entities/package_info_entity.dart';
import 'package:core/src/utils/package_info/domain/failures/package_info_failure.dart';
import 'package:core/src/utils/package_info/domain/services/i_package_info_service.dart';
import 'package:core/src/utils/package_info/infra/driver/i_package_info_driver.dart';
import 'package:core/src/utils/state_management/domain/interfaces/interfaces/either.dart';

class PackageInfoService extends IPackageInfoService {
  PackageInfoService({required this.packaInfoDriver});
  final IPackageInfoDriver packaInfoDriver;

  @override
  Future<Either<IPackageInfoFailure, PackageInfoEntity>> fetchInfoApp() async {
    return packaInfoDriver.fetchAppInfo();
  }
}
