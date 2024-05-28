import '../data/modular_navigation_driver.dart';
import '../infra/i_navigation_driver.dart';

///
/// Provides a static access to a singleton that implements [Navigation]
///
mixin Nav {
  static INavigationDriver get to => ModularNavigationDriver.i();
}
