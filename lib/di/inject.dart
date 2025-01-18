import 'package:gallery/gallery.module.dart';
import 'package:shared/di/service_locator.dart';
import 'package:shared/shared.module.dart';
import 'package:settings/settings.module.dart';
import 'inject.config.dart';

@InjectableInit(
  initializerName: 'init',
  throwOnMissingDependencies: true,
  externalPackageModulesBefore: [
    ExternalModule(SharedPackageModule),
    ExternalModule(GalleryPackageModule),
    ExternalModule(SettingsPackageModule),
  ],
)
Future<void> configureDependencies() async => sl.init();
