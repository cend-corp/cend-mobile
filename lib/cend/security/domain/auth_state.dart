import 'package:cend/cend/security/domain/auth_model.dart';
import 'package:cend/cend/security/domain/session_model.dart';
import 'package:equatable/equatable.dart';

// TODO: 23.02.2022 freezed?
abstract class AuthState extends Equatable {
  AuthModel getAuthModel();
}

class InEditingState extends AuthState {
  final AuthModel authModel;

  InEditingState({required this.authModel});

  @override
  List<Object?> get props => [authModel];

  @override
  AuthModel getAuthModel() => authModel;
}

class LoadingState extends AuthState {
  final AuthModel authModel;

  LoadingState(this.authModel);

  @override
  AuthModel getAuthModel() => authModel;

  @override
  List<Object?> get props => [authModel];
}

class SuccessfulState extends AuthState {
  final SessionModel session;

  SuccessfulState(this.session);

  @override
  AuthModel getAuthModel() =>
      AuthModel(spyWord: '', uuidInputExpanded: false, errorPopupShowed: false);

  @override
  List<Object?> get props => [session];
}

class ErrorState extends AuthState {
  final AuthModel authModel;
  final String? message;

  ErrorState({required this.authModel, this.message});

  @override
  AuthModel getAuthModel() => authModel;

  @override
  List<Object?> get props => [message, authModel];
}
