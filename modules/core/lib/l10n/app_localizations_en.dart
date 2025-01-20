import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get requirePermission => 'Require Permission';

  @override
  String get requirePermissionDescription => 'To show your black and white photos we just need your folder permission. We promise, we don’t take your photos.';

  @override
  String get appName => 'Snapix';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get thememode => 'Theme Mode';

  @override
  String get grantAccess => 'Grant Access';

  @override
  String get albums => 'Albums';

  @override
  String photos(int count) {
    return '$count Photos';
  }

  @override
  String get someErrorOccured => 'Some Error Occured!';
}
