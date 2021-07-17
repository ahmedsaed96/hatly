import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/home/home_layout.dart';

import 'package:shop_abdullah_mansour/register_and_login/login_cubit.dart';
import 'package:shop_abdullah_mansour/register_and_login/register_cubit.dart';

import './cache/cache_helper.dart';

import './dio_helper/dio_helper.dart';
import './home/home_cubit.dart';

import './register_and_login/bloc_observer.dart';
import './register_and_login/login_screen.dart';

import './view/screens/on_boarding_screen.dart';
import 'share/constant.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  // ignore: prefer_final_locals
  bool? isOnBoardingSkipped = CacheHelper.getbool(key: 'onBoarding') ?? false;
  // ignore: prefer_final_locals
  String? token = CacheHelper.getString(key: 'token');
  Widget? firstPage;
  if (isOnBoardingSkipped) {
    if (token != null) {
      firstPage = HomeLayout();
    } else {
      firstPage = LoginScreen();
    }
  } else {
    firstPage = OnBoardingscreen();
  }
  runApp(MyApp(firstPage));
}

class MyApp extends StatelessWidget {
  final Widget firstPage;
  const MyApp(this.firstPage);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit()
              ..getHomeData()
              ..getCategoryData()
              ..getFavorites()
              ..getOnlineFavoritesList()
              ..getprofileInfo(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          //i need dark mode
          theme: lightTheme,
          title: 'Hatly APP',
          home: firstPage,
        ));
  }
}
