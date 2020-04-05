import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthBase with _$AuthController;

abstract class _AuthBase with Store {
  // final IAuthRepository _authRepository = Modular.get();

  @observable

  // TODO: Login Type.

  _AuthBase() {
    Future.delayed(Duration(seconds: 3), () => {_init()});
  }

  @action
  changeAuthStatus(user) {
    _onStateChanged();
  }

  // TODO: Login Action.

  _init() {
    Modular.to.pushReplacementNamed('/home');
    // _authRepository.getUserState().listen(changeAuthStatus);
  }

  _onStateChanged() {
    // Modular.to.pushReplacementNamed('/home');
  }
}
