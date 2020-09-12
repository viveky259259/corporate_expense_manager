class LoginEvent {}

class LoginUser extends LoginEvent {
  String userId;
  String password;

  LoginUser(this.userId, this.password);
}

