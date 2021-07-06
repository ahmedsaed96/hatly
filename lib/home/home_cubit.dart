import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/cache/cache_helper.dart';
import 'package:shop_abdullah_mansour/categories/categories_scree.dart';
import 'package:shop_abdullah_mansour/dio_helper/dio_helper.dart';
import 'package:shop_abdullah_mansour/dio_helper/end_points.dart';
import 'package:shop_abdullah_mansour/favorite/favorite_screen.dart';

import 'package:shop_abdullah_mansour/home/home_page.dart';
import 'package:shop_abdullah_mansour/models/home_model.dart';

import 'package:shop_abdullah_mansour/settings/settings_screen.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialStates());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeIndexStates());
  }

  HomeModel? homeModel;
  void getHomeData() {
    emit(HomeProductsLoadingStates());
    DioHelper.getData(
      hOME,
      CacheHelper.getString(key: 'token'),
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data as Map<String, dynamic>);
      //  debugPrint('${homeModel.data!.products[0].description}');
      emit(HomeProductsSuccesStates());
    }).catchError((e) {
      emit(HomeProductsErrorStates());
      debugPrint('getHomeData Func error =$e');
    });
  }
}
