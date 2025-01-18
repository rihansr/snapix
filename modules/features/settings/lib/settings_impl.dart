part of 'settings.dart';

@Singleton()
class Settings {
  ValueNotifier<SettingsModel> notifier = ValueNotifier((() {
    final settings = sl<SharedPrefs>().settings;
    return settings == null
        ? const SettingsModel()
        : SettingsModel.fromJson(settings);
  }()));

  set _settings(SettingsModel settings) {
    notifier.value = settings;
    sl<SharedPrefs>().settings = settings.toJson();
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    notifier.notifyListeners();
  }

  // Theme
  set theme(ThemeMode mode) =>
      _settings = notifier.value.copyWith(themeMode: mode);

  ThemeMode get theme => notifier.value.themeMode;

  // Locale
  set language(Language language) =>
      _settings = notifier.value.copyWith(language: language);

  Language get language => notifier.value.language;
}
