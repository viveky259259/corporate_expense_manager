import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:corporate_expense_manager/bloc/login/login_event.dart';
import 'package:corporate_expense_manager/bloc/login/login_state.dart';
import 'package:corporate_expense_manager/models/user/user.dart';
import 'package:corporate_expense_manager/models/user/user_local.dart';
import 'package:corporate_expense_manager/models/user/user_repo.dart';
import 'package:crypto/crypto.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepo userRepo = UserRepo.instance;
  User user;

  @override
  LoginState get initialState => InitState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUser) {
      yield LogginIn();
      var user = await userRepo.loginUser(
          userId: event.userId,
          password: md5.convert(utf8.encode(event.password)).toString());
      if (user == null)
        yield LoginFailed();
      else {
        await UserLocal.instance.saveUser(user);
        yield LoggedIn(user);
      }
    }
  }
}
