import 'package:qclass_p/constants/config_envs.dart';

import 'domain/enums/flavors_type.dart';
import 'main.dart';

Future<void> main() async {
  await ConfigEnvs().loadEnv(FlavorsType.prod);
  runBaseApp();
}
