import 'package:cend/settings/ui/settings_item.dart';
import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  final List<SettingsItem> settings;

  const SettingsList({Key? key, required this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: settings.length,
      itemBuilder: (context, index) {
        return settings[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
