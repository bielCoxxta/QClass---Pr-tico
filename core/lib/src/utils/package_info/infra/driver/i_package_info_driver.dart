import 'package:core/src/utils/package_info/domain/entities/package_info_entity.dart';
import 'package:core/src/utils/package_info/domain/failures/package_info_failure.dart';

import '../../../state_management/domain/interfaces/interfaces/either.dart';

abstract class IPackageInfoDriver {
  Future<Either<IPackageInfoFailure, PackageInfoEntity>> fetchAppInfo();
}
