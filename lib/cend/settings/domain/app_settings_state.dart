import 'package:cend/cend/settings/domain/app_settings.dart';
import 'package:equatable/equatable.dart';

abstract class AppSettingsState extends Equatable{}

class LoadingState extends AppSettingsState{
  @override
  List<Object?> get props => [];
}

class LoadedState extends AppSettingsState{
  final AppSettings settings;

  LoadedState(this.settings);

  @override
  List<Object?> get props => [settings];
}

class ErrorState extends AppSettingsState{
  @override
  List<Object?> get props => [];
}