import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:qclass_p/presentation/controllers/theme_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final x = Modular.get<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder<ThemeMode>(
              valueListenable: x,
              builder: (context, state, _) {
                return Text(state.name);
              },
            ),
            TextButton(
              onPressed: () {
                x.changeTheme();
              },
              child: const Text('Trocar thema'),
            )
          ],
        ),
      ),
    );
  }
}
