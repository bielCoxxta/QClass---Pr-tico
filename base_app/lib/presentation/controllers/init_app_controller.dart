import 'package:core/core.dart';

class InitAppController extends CustomController<Exception, Unit> {
  InitAppController({required this.appInfoService}) : super(unit);
  final IPackageInfoService appInfoService;

  Future<PackageInfoEntity?> fetchInfoApp() async {
    return await appInfoService.fetchInfoApp().then(
          (result) => result.fold((l) => null, (data) => data),
        );
  }
}
