import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_abdullah_mansour/dio_helper/dio_helper.dart';
import 'package:shop_abdullah_mansour/register_and_login/bloc_observer.dart';
import 'package:shop_abdullah_mansour/view/screens/on_boarding_screen.dart';

import 'share/constant.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: defaultColor,
      ),
      title: 'Hatly APP',
      home: OnBoardingscreen(),
    );
  }
}
