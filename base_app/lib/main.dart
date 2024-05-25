import 'dart:async';

import 'package:core/core.dart' show ModularApp;
import 'package:flutter/material.dart';

import 'app_module.dart';
import 'presentation/pages/app_widget.dart';

FutureOr<void> runBaseApp() async {
  final globalConfigs = GlobalConfigs();
  try {
    WidgetsFlutterBinding.ensureInitialized();

    return runApp(
      ModularApp(
        module: AppModule(globalConfigs: globalConfigs),
        child: const AppWidget(),
      ),
    );
  } catch (exception) {
    globalConfigs.crashLog.capture(exception: exception);
  }
}
