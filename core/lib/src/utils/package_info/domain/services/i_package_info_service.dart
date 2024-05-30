import 'package:core/src/utils/package_info/domain/entities/package_info_entity.dart';

import '../../../state_management/domain/interfaces/interfaces/either.dart';
import '../failures/package_info_failure.dart';

abstract class IPackageInfoService {
  Future<Either<IPackageInfoFailure, PackageInfoEntity>> fetchInfoApp();
}
