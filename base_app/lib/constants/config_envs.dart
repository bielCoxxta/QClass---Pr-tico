import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qclass_p/domain/enums/flavors_type.dart';

import '../domain/entities/environment_entity.dart';

class ConfigEnvs {
  Future<void> loadEnv(FlavorsType type) async {
    FlavorsType.selectedType = type;
    await dotenv.load(fileName: '.environment/.env.${type.name}').catchError(
      (onError) {
        debugPrint('Verifique a pasta: base_app/.environment/');
        debugPrint('Detalhes do error: $onError');
      },
    );
  }

  static EnvironmentEntity get environment {
    final appName = dotenv.get('APP_NAME', fallback: 'QClass');
    final appBaseUrl = dotenv.get('APP_BASE_URL', fallback: '');
    final coreBaseUrl = dotenv.get('CORE_BASE_URL', fallback: '');

    return EnvironmentEntity(
      appName: appName,
      appBaseUrl: appBaseUrl,
      coreBaseUrl: coreBaseUrl,
      flavorType: FlavorsType.selectedType,
    );
  }
}
