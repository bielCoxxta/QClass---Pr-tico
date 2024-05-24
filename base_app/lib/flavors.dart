enum Flavor {
  prod,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'QClass Prático';
      case Flavor.dev:
        return 'QClass Prático DEV';
      default:
        return 'title';
    }
  }

}
