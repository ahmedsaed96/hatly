import 'package:shop_abdullah_mansour/models/register_model.dart';


abstract class RegisterStates {}

class RegisterIntialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}
class RegisterSucsessState1 extends RegisterStates {}

class RegisterSucsessState extends RegisterStates {
  UserRegisterModel registerModel;
  RegisterSucsessState(this.registerModel);
}

class RegistererrorState extends RegisterStates {
  final String error;
  RegistererrorState(this.error);
}

class RegisterchangevisibiltyState extends RegisterStates {}
