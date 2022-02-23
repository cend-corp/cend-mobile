import 'package:cend/cend/settings/data/constants.dart';
import 'package:cend/cend/settings/domain/app_settings_cubit.dart';
import 'package:cend/cend/settings/domain/app_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        final settings = (state as LoadedState).settings;
        return DropdownButton<String>(
          underline: Container(),
          items: _availableLanguages(),
          value: settings.locale.languageCode,
          icon: const Icon(Icons.language),
          onChanged: (code) =>
              context.read<AppSettingsCubit>().changeLocale(code ?? 'en'),
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _availableLanguages() {
    return AppSettingsConstants.supportedLocales.map((locale) {
      return DropdownMenuItem(
        child: Text(locale.languageCode),
        value: locale.languageCode,
      );
    }).toList();
  }
}
