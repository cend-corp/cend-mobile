import 'package:cend/settings/domain/app_settings_cubit.dart';
import 'package:cend/settings/domain/app_settings_state.dart';
import 'package:cend/widgets/atoms/switch_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        var settings = (state as LoadedState).settings;
        return SwitchWithIcon(
          value: settings.themeMode == ThemeMode.dark,
          icon: const Icon(Icons.brightness_2_outlined),
          onChanged: (theme) =>
              context.read<AppSettingsCubit>().changeTheme(theme),
        );
      },
    );
  }
}
