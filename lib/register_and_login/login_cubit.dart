import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/dio_helper/dio_helper.dart';
import 'package:shop_abdullah_mansour/dio_helper/end_points.dart';
import 'package:shop_abdullah_mansour/register_and_login/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  bool obsecureText = true;
  IconData suffixIcon = Icons.visibility;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void changevisibilty() {
    obsecureText = !obsecureText;
    if (suffixIcon == Icons.visibility) {
      suffixIcon = Icons.visibility_off;
    } else {
      suffixIcon = Icons.visibility;
    }
    emit(LoginchangevisibiltyState());
  }

  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      lOGIN,
      {
        'email': email,
        'password': password,
      },
    ).then((value) {
      debugPrint('${value.data}');
      emit(LoginSucsessState());
    }).catchError((error) {
      debugPrint('$error');
      emit(LoginerrorState(error.toString()));
    });
  }
}
