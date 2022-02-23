import 'package:cend/cend/settings/domain/app_settings.dart';

abstract class AppSettingsRepo{
  Future<void> saveSettings(AppSettings settings);

  Future<AppSettings> loadSettings();
}