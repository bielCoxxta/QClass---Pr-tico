import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final x = Modular.get<ThemeController>();

  @override
  void initState() {
    super.initState();
    // verifica seção do usuário
    Modular.to.navigate(AuthRoutes.root.path);
  }

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
