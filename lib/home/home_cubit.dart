import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cache/cache_helper.dart';
import '../categories/categories_scree.dart';
import '../dio_helper/dio_helper.dart';
import '../dio_helper/end_points.dart';
import '../favorite/favorite_screen.dart';
import '../home/home_page.dart';
import '../models/category_model.dart';
import '../models/home_model.dart';

import '../settings/settings_screen.dart';

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
      emit(HomeProductsSuccesStates());
    }).catchError((e) {
      emit(HomeProductsErrorStates());
      debugPrint('getHomeData Func error =$e');
    });
  }

  CategoryModel? categoryModel;
  void getCategoryData() {
    DioHelper.getCategoryData(
      cATEGORIES,
    ).then((value) {
      categoryModel =
          CategoryModel.fromJson(value.data as Map<String, dynamic>);
      emit(HomeCategorySuccessStates());
    }).catchError((e) {
      emit(HomeCategoryErrorStates());
      debugPrint('categoryModel Func error =$e');
    });
  }
}
