import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get requirePermission => 'Requiere Permiso';

  @override
  String get requirePermissionDescription => 'Para mostrar tus fotos en blanco y negro, solo necesitamos permiso para acceder a tu carpeta. Prometemos no tomar tus fotos.';

  @override
  String get appName => 'Snapix';

  @override
  String get settings => 'Ajustes';

  @override
  String get language => 'Idioma';

  @override
  String get thememode => 'Modo de tema';

  @override
  String get grantAccess => 'Conceder Acceso';

  @override
  String get albums => 'Álbumes';

  @override
  String photos(int count) {
    return '$count Fotos';
  }

  @override
  String get someErrorOccured => '¡Ocurrió un error!';
}
