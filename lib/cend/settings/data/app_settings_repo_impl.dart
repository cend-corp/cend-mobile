import 'dart:convert';

import 'package:cend/cend/settings/data/app_settings_repo.dart';
import 'package:cend/cend/settings/data/constants.dart';
import 'package:cend/cend/settings/domain/app_settings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSettingsRepoImpl extends AppSettingsRepo {
  final FlutterSecureStorage storage;

  AppSettingsRepoImpl(this.storage);

  @override
  Future<AppSettings> loadSettings() async {
    var settingsStr = await storage.read(key: 'settings');
    if (settingsStr == null) {
      return AppSettingsConstants.initialSetting;
    } else {
      return AppSettings.fromJson(jsonDecode(settingsStr));
    }
  }

  @override
  Future<void> saveSettings(AppSettings settings) async {
    await storage.write(key: 'settings', value: jsonEncode(settings.toJson()));
  }
}
