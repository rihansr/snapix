library settings;
import 'package:shared/di/service_locator.dart';

@InjectableInit.microPackage(
  preferRelativeImports: true,
  throwOnMissingDependencies: false,
)
void settings() {}