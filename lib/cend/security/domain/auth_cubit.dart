import 'package:cend/cend/security/data/auth_repo.dart';
import 'package:cend/cend/security/domain/auth_model.dart';
import 'package:cend/cend/security/domain/auth_state.dart';
import 'package:cend/configs/app_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final regexp = RegExp(AppConfig.uuidRegex);

  AuthCubit(this.authRepo)
      : super(InEditingState(
            authModel: AuthModel(
                spyWord: '',
                uuidInputExpanded: false,
                errorPopupShowed: false)));

  Future<void> onSpyWordUpdate(String spyWord) async {
    final newModel = state.getAuthModel().copyWith(spyWord: spyWord);
    emit(InEditingState(authModel: newModel));
  }

  Future<void> onUuidUpdate(String uuid) async {
    final newModel = state.getAuthModel().copyWith(uuid: uuid);
    emit(InEditingState(authModel: newModel));
  }

  Future<void> hideErrorPopup() async {
    final newModel =
        state.getAuthModel().copyWith(errorPopupShowed: false);
    emit(InEditingState(authModel: newModel));
  }

  Future<void> signUp() async {
    var currentAuthModel = state.getAuthModel();
    if (currentAuthModel.uuidInputExpanded&&(currentAuthModel.uuid ?? '').isEmpty) {
      emit(InEditingState(
        authModel: currentAuthModel.copyWith(uuidInputExpanded: false),
      ));
      return;
    }
    if (await _inputsValid()) {
      try {
        emit(LoadingState(currentAuthModel));
        var sessionModel = await authRepo.signUp(currentAuthModel);
        emit(SuccessfulState(sessionModel));
      } catch (e) {
        await _catchServerError(e);
      }
    }
  }

  Future<void> signIn() async {
    var currentAuthModel = state.getAuthModel();
    if (!currentAuthModel.uuidInputExpanded) {
      emit(InEditingState(
        authModel: currentAuthModel.copyWith(uuidInputExpanded: true),
      ));
    } else {
      if (await _inputsValid()) {
        try {
          emit(LoadingState(currentAuthModel));
          var sessionModel = await authRepo.signIn(currentAuthModel);
          emit(SuccessfulState(sessionModel));
        } catch (e) {
          await _catchServerError(e);
        }
      }
    }
  }

  Future<void> logout() async {}

  Future<bool> _inputsValid() async {
    var current = state.getAuthModel().copyWith(errorPopupShowed: true);
    var spyWordValid = await _currentSpyWordValid();
    if (!spyWordValid) {
      emit(ErrorState(
        authModel: current,
        message: 'spy word empty!',
      ));
      return false;
    }
    if (current.uuidInputExpanded) {
      var uuidValid = await _currentUuidValid();
      if (!uuidValid && !spyWordValid) {
        emit(ErrorState(
          authModel: current,
          message: 'spy word and uuid invalid!',
        ));
        return false;
      }
      if (!uuidValid) {
        emit(ErrorState(
          authModel: current,
          message: 'uuid have invalid format or empty!',
        ));
        return false;
      }
    }
    return true;
  }

  Future<bool> _currentSpyWordValid() async {
    var _spyWord = state.getAuthModel().spyWord;
    return _spyWord.trim().isNotEmpty;
  }

  Future<bool> _currentUuidValid() async {
    final _uuid = state.getAuthModel().uuid;
    return _uuid != null &&
        _uuid.trim().isNotEmpty &&
        regexp.hasMatch(_uuid.toString());
  }

  Future<void> _catchServerError(Object error) async {
    var current = AuthModel(
        spyWord: '', uuidInputExpanded: false, errorPopupShowed: true);
    switch (error.runtimeType) {
      case DioError:
        var message = (error as DioError).response?.statusMessage;
        emit(ErrorState(authModel: current, message: message));
        break;
      default:
        emit(ErrorState(authModel: current, message: "Unexpected error"));
        break;
    }
  }
}
