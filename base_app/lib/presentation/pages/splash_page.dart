import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../controllers/init_app_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final initAppController = Modular.get<InitAppController>();

  @override
  void initState() {
    super.initState();
    loadingApp();
    // verifica seção do usuário
    Modular.to.navigate(AuthRoutes.root.path);
  }

  void loadingApp() async {
    await initAppController.fetchInfoApp().then((value) {
      // como essa instância deve ser chamada antes do RunApp foi necessário criar uma instância
      // de mock e substituir a mesma quando tiver carregado os dados do package
      if (value != null) Modular.replaceInstance(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [],
        ),
      ),
    );
  }
}
