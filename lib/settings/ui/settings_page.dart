import 'package:cend/settings/ui/settings_item.dart';
import 'package:cend/settings/ui/settings_list.dart';
import 'package:cend/widgets/atoms/language_switcher.dart';
import 'package:cend/widgets/atoms/theme_switcher.dart';
import 'package:cend/widgets/organisms/stack_with_logout_button.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StackWithLogoutButton(
      child: SettingsList(
        settings: [
          SettingsItem(
            title: 'Dark theme',
            setting: ThemeSwitcher(),
          ),
          SettingsItem(
            title: 'Language',
            setting: LanguageSwitcher(),
          ),
        ],
      ),
    );
  }
}
