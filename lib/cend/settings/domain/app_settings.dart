import 'package:flutter/material.dart';

class AppSettings {
  final ThemeMode themeMode;
  final Locale locale;

  const AppSettings(this.themeMode, this.locale);

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    var theme = json['theme'] == 'dark' ? ThemeMode.dark : ThemeMode.light;
    var locale = Locale(json['locale']);
    return AppSettings(theme, locale);
  }

  Map<String, dynamic> toJson() {
    var theme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    return {
      'theme': theme,
      'locale': locale.languageCode,
    };
  }
}
