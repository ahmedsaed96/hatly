import 'package:shop_abdullah_mansour/models/user_login_model.dart';

abstract class LoginStates {}

class LoginIntialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSucsessState extends LoginStates {
  UserLoginModel loginModel;
  LoginSucsessState(this.loginModel);
}

class LoginerrorState extends LoginStates {
  final String error;
  LoginerrorState(this.error);
}

class LoginchangevisibiltyState extends LoginStates {}

