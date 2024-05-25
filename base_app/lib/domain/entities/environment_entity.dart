import 'package:qclass_p/domain/enums/flavors_type.dart';

class EnvironmentEntity {
  const EnvironmentEntity({
    required this.appName,
    required this.appBaseUrl,
    required this.coreBaseUrl,
    this.flavorType,
  });

  final String appName;
  final String appBaseUrl;
  final String coreBaseUrl;
  final FlavorsType? flavorType;
}
