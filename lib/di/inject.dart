import 'package:shared/di/service_locator.dart';
import 'package:shared/shared.module.dart';
import 'inject.config.dart';

@InjectableInit(
  initializerName: 'init',
  throwOnMissingDependencies: true,
  externalPackageModulesBefore: [
    ExternalModule(SharedPackageModule),
  ],
)
Future<void> configureDependencies() async => sl.init();
