import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'language_enum.dart';
part 'settings_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SettingsModel {
  @JsonKey(name: "theme_mode")
  final ThemeMode themeMode;
  @JsonKey(name: "lang")
  final Language language;

  const SettingsModel({
    this.themeMode = ThemeMode.system,
    this.language = Language.english,
  });

  SettingsModel copyWith({ThemeMode? themeMode, Language? language,}) {
    return SettingsModel(
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
    );
  }

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);

}
