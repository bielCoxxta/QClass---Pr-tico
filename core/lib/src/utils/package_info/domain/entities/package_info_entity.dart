class PackageInfoEntity {
  PackageInfoEntity({
    required this.appName,
    required this.name,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
    required this.forceUpdate,
  });

  final String appName;
  final String name;
  final String version;
  final int buildNumber;
  final String buildSignature;
  final bool forceUpdate;
}
