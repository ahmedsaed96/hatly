abstract class LoginStates {}

class LoginIntialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSucsessState extends LoginStates {}

class LoginerrorState extends LoginStates {
  final String error;
  LoginerrorState(this.error);
}

class LoginchangevisibiltyState extends LoginStates {}

// class UserLoginState extends LoginStates {}
//
