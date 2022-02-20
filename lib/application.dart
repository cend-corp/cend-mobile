import 'package:cend/chats/ui/chats_page.dart';
import 'package:cend/profile/ui/profile_page.dart';
import 'package:cend/settings/data/app_settings_repo_impl.dart';
import 'package:cend/settings/data/constants.dart';
import 'package:cend/settings/domain/app_settings_cubit.dart';
import 'package:cend/settings/domain/app_settings_state.dart';
import 'package:cend/settings/ui/settings_page.dart';
import 'package:cend/tweats/ui/tweats_page.dart';
import 'package:cend/widgets/organisms/app_bar.dart';
import 'package:cend/widgets/organisms/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedIndex = 0;
  late final List<Widget> _pages = _availablePages();

  @override
  Widget build(BuildContext context) {
    var currentPage = _pages.elementAt(_selectedIndex);
    const storage = FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsCubit>(
            create: (BuildContext context) =>
                AppSettingsCubit(AppSettingsRepoImpl(storage))..loadProps()),
      ],
      child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (context, state) {
          // TODO: 20.02.2022
          if (state is LoadingState) return Container();
          final settings = (state as LoadedState).settings;
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            debugShowCheckedModeBanner: false,
            themeMode: settings.themeMode,
            locale: settings.locale,
            darkTheme: AppSettingsConstants.darkTheme,
            theme: AppSettingsConstants.lightTheme,
            supportedLocales: AppSettingsConstants.supportedLocales,
            home: Scaffold(
              appBar: const CendAppBar(),
              body: currentPage,
              bottomNavigationBar: CendNavBar(
                onTap: _onTap,
                selectedIndex: _selectedIndex,
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _availablePages() {
    return const [
      ChatsPage(),
      TweatsPage(),
      ProfilePage(),
      SettingsPage(),
    ];
  }

  void _onTap(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }
}
