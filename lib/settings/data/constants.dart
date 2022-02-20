import 'package:cend/settings/domain/app_settings.dart';
import 'package:flutter/material.dart';

abstract class AppSettingsConstants{
  static ThemeData lightTheme = ThemeData.light();

  static ThemeData darkTheme = ThemeData.dark();

  static const AppSettings initialSetting = AppSettings(ThemeMode.light,Locale('en'));

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ru'),
  ];

}