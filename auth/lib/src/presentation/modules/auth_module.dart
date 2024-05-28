import 'package:auth/src/presentation/pages/login/login_page.dart';
import 'package:core/core.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(Modular.initialRoute, child: (context) => const LoginPage());
  }
}
