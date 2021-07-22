import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/cache/cache_helper.dart';
import 'package:shop_abdullah_mansour/dio_helper/dio_helper.dart';
import 'package:shop_abdullah_mansour/dio_helper/end_points.dart';
import 'package:shop_abdullah_mansour/home/home_layout.dart';
import 'package:shop_abdullah_mansour/models/register_model.dart';
import 'package:shop_abdullah_mansour/register_and_login/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntialState());
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  bool obsecureText = true;
  IconData suffixIcon = Icons.visibility;
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
    emit(RegisterchangevisibiltyState());
  }

  UserRegisterModel? registerModel;
  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
    required BuildContext? context,
    TextEditingController? nameController,
    TextEditingController? passwordController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      rEGISTER,
      {
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      debugPrint('value userRegister fun =${value.data.toString()}');
      registerModel =
          UserRegisterModel.fromJson(value.data as Map<String, dynamic>);
      CacheHelper.setAnyValue(key: 'token', value: registerModel!.data!.token)
          .then((value) {
        Navigator.of(context!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => HomeLayout()), (route) => false);
      }).catchError((e) {
        debugPrint('setAnyValue inside userRegister func error =$e');
      });
      // storeApiLocallAndNavigate(
      //   context!,
      //   registerModel!.data!.token,
      //   nameController!,
      //   passwordController!,
      //   emailController!,
      //   phoneController!,
      // );
      emit(RegisterSucsessState(registerModel!));
    }).catchError((error) {
      debugPrint('error userRegister fun =$error');
      emit(RegistererrorState(error.toString()));
    });
  }
//   void storeApiLocallAndNavigate(
//   BuildContext context,
//   String? token,
//   TextEditingController nameController,
//   TextEditingController passwordController,
//   TextEditingController emailController,
//   TextEditingController phoneController,
// ) {
//   CacheHelper.setAnyValue(key: 'token', value: token).then((value) {
//     nameController.clear();
//     passwordController.clear();
//     emailController.clear();
//     phoneController.clear();

//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (_) => HomeLayout()), (route) => false);
//   }).catchError((e) {
//     debugPrint('cant navigate to home screen e = ${e.toString()}');
//   });
// }
}
