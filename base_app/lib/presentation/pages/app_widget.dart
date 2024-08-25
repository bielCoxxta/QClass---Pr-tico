import 'package:core/core.dart';
import 'package:design_system_qclass/design_system_qclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qclass_p/domain/entities/environment_entity.dart';
import 'package:qclass_p/domain/enums/flavors_type.dart';
// import 'package:design_system_qclass/lib';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final themeController = Modular.get<ThemeController>();

  @override
  void initState() {
    super.initState();
    Modular.setNavigatorKey(GlobalKey<NavigatorState>());
    Modular.setObservers([RouterObserver()]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeController,
          builder: (context, state, _) {
            SystemChrome.setSystemUIOverlayStyle(
              state == ThemeMode.light
                  ? SystemUiOverlayStyle.light
                  : SystemUiOverlayStyle.dark,
            );

            return ScreenUtilInit(
              designSize: size,
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, _) {
                return MaterialApp.router(
                  title: Modular.get<EnvironmentEntity>().appName,
                  themeMode: state,
                  theme: AppThemes.createLightTheme(),
                  darkTheme: AppThemes.createDarkTheme(),
                  debugShowCheckedModeBanner:
                      FlavorsType.selectedType == FlavorsType.dev,
                  supportedLocales: const [Locale('pt', 'BR')],
                  locale: const Locale('pt', 'BR'),
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  routerConfig: Modular.routerConfig,
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaler: const TextScaler.linear(1.0),
                      ),
                      child: GestureDetector(
                        onTap: () => SystemChannels.textInput.invokeMethod(
                          'TextInput.hide',
                        ),
                        child: child ?? const SizedBox(),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
