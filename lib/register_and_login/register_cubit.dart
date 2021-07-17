import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/register_and_login/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  RegisterCubit() : super(RegisterInitialStates());
  TextEditingController registerUserNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  GlobalKey<FormState> registerFormkey = GlobalKey<FormState>();
}
