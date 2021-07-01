import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_abdullah_mansour/dio_helper/dio_helper.dart';
import 'package:shop_abdullah_mansour/dio_helper/end_points.dart';
import 'package:shop_abdullah_mansour/models/user_login_model.dart';
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
      final UserLoginModel loginModel =
          UserLoginModel.fromJson(value.data as Map<String, dynamic>);
      debugPrint('your success is =${value.data}');
      emit(LoginSucsessState(loginModel));
    }).catchError((error) {
      debugPrint('error from user login fun =$error');
      emit(LoginerrorState(error.toString()));
    });
  }
}
/* 
    Fluttertoast.showToast(
          msg: loginModel.message.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0); 
          */
