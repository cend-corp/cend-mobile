import 'package:cend/settings/data/app_settings_repo.dart';
import 'package:cend/settings/data/constants.dart';
import 'package:cend/settings/domain/app_settings.dart';
import 'package:cend/settings/domain/app_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit(this.repo)
      : super(LoadedState(AppSettingsConstants.initialSetting));

  final AppSettingsRepo repo;
  late AppSettings _current;

  Future<void> loadProps() async {
    emit(LoadingState());
    try {
      _current = await repo.loadSettings();
      emit(LoadedState(_current));
    } catch (e) {
      emit(LoadedState(AppSettingsConstants.initialSetting));
    }
  }

  Future<void> changeLocale(String langCode) async {
    var locale = Locale(langCode, '');
    if (locale == _current.locale) return;
    if (!AppSettingsConstants.supportedLocales.contains(locale)) {
      emit(ErrorState());
    } else {
      await saveSettings(AppSettings(_current.themeMode, locale));
    }
  }

  Future<void> changeTheme(bool darkTheme) async {
    var mode = darkTheme ? ThemeMode.dark : ThemeMode.light;
    if (mode == _current.themeMode) return;
    await saveSettings(AppSettings(mode, _current.locale));
  }

  Future<void> saveSettings(AppSettings settings) async {
    try {
      await repo.saveSettings(settings);
      emit(LoadedState(settings));
      _current = settings;
    } catch (e) {
      emit(ErrorState());
    }
  }
}
