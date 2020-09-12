import 'package:corporate_expense_manager/models/user/user.dart';

class LoginState {}

class InitState extends LoginState {}

class LogginIn extends LoginState {}

class LoggedIn extends LoginState {
  User user;

  LoggedIn(this.user);
}

class LoginFailed extends LoginState {}

