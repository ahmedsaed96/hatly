import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/cache/cache_helper.dart';

import 'package:shop_abdullah_mansour/dio_helper/dio_helper.dart';
import 'package:shop_abdullah_mansour/dio_helper/end_points.dart';
import 'package:shop_abdullah_mansour/home/home_layout.dart';

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
  TextEditingController registerUserNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  GlobalKey<FormState> registerFormkey = GlobalKey<FormState>();
  void changevisibilty() {
    obsecureText = !obsecureText;
    if (suffixIcon == Icons.visibility) {
      suffixIcon = Icons.visibility_off;
    } else {
      suffixIcon = Icons.visibility;
    }
    emit(LoginchangevisibiltyState());
  }

  void userLogin(
      {required String email,
      required String password,
      required BuildContext? context,
      TextEditingController? nameController,
      TextEditingController? passwordController}) {
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
      storeApiLocallAndNavigate(
        context!,
        loginModel.data!.token,
        nameController!,
        passwordController!,
      );
      emit(LoginSucsessState(loginModel));
    }).catchError((error) {
      debugPrint('error from user login fun =$error');
      emit(LoginerrorState(error.toString()));
    });
  }
}

void storeApiLocallAndNavigate(
    BuildContext context,
    String? token,
    TextEditingController nameController,
    TextEditingController passwordController) {
  CacheHelper.setAnyValue(key: 'token', value: token).then((value) {
    nameController.clear();
    passwordController.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => HomeLayout()), (route) => false);
  }).catchError((e) {
    debugPrint('cant navigate to home screen e = ${e.toString()}');
  });
}
