import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/cache/cache_helper.dart';
import 'package:shop_abdullah_mansour/categories/categories_screen.dart';
import 'package:shop_abdullah_mansour/models/change_favorites_model.dart';
import 'package:shop_abdullah_mansour/models/get_favorites_model.dart';
import 'package:shop_abdullah_mansour/models/user_login_model.dart';
import '../dio_helper/dio_helper.dart';
import '../dio_helper/end_points.dart';
import '../favorite/favorite_screen.dart';
import '../home/home_page.dart';
import '../models/category_model.dart';
import '../models/home_model.dart';
import '../settings/settings_screen.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialState());
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
    emit(HomeChangeIndexState());
  }

  TextEditingController profilenameController = TextEditingController();
  TextEditingController profilePhoneController = TextEditingController();
  Map<int, bool> favorites = {};
  HomeModel? homeModel;
  void getHomeData() {
    emit(HomeProductsLoadingState());
    DioHelper.getData(
      hOME,
      CacheHelper.getString(key: 'token'),
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data as Map<String, dynamic>);
      // ignore: avoid_function_literals_in_foreach_calls
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          // ignore: cast_nullable_to_non_nullable
          element.id as int: element.inFavorites as bool,
        });
      });
      emit(HomeProductsSuccesState());
    }).catchError((e) {
      emit(HomeProductsErrorState());
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
      emit(HomeCategorySuccessState());
    }).catchError((e) {
      emit(HomeCategoryErrorState());
      debugPrint('categoryModel Func error =$e');
    });
  }

  void getFavorites() {
    DioHelper.getData(fAVORITES, CacheHelper.getString(key: 'token'))
        .then((value) {})
        .catchError((e) {
      debugPrint(e.toString());
    });
  }

  ChangeFavoriteModel? favoriteModel;
  void addOrDeleteFromFavorites(int id) {
    favorites[id] = !favorites[id]!;
    emit(HomeChangeLocalFavoriteSuccessState());
    DioHelper.postData(
      fAVORITES,
      {"product_id": id},
      token: CacheHelper.getString(key: 'token'),
    ).then((value) {
      favoriteModel =
          ChangeFavoriteModel.fromJson(value.data as Map<String, dynamic>);
      if (!favoriteModel!.status!) {
        favorites[id] = !favorites[id]!;
      } else {
        getOnlineFavoritesList();
      }
      emit(HomeChangeFavoriteSuccessState());
    }).catchError((e) {
      favorites[id] = !favorites[id]!;
      emit(HomeChangeFavoriteErrorState());
      debugPrint(e.toString());
    });
  }

  OnlineFavorites? onlineFavorites;
  void getOnlineFavoritesList() {
    emit(HomeOnlineFavoritesLisLoadingState());
    DioHelper.getData(
      fAVORITES,
      CacheHelper.getString(key: 'token'),
    ).then((value) {
      emit(HomeOnlineFavoritesLisSuccesState());
      onlineFavorites =
          OnlineFavorites.fromJson(value.data as Map<String, dynamic>);
    }).catchError((e) {
      emit(HomeOnlineFavoritesLisErrorState());
      debugPrint(e.toString());
    });
  }

  UserLoginModel? profileInfo;
  void getprofileInfo() {
    emit(HomeProfileInfoLoadingState());
    DioHelper.getData(
      pROFILE,
      CacheHelper.getString(key: 'token'),
    ).then((value) {
      // debugPrint(value.data.toString()); الداتا جت بس مش عارف فين الخطا
      emit(HomeProfileInfoSuccesState());
      profileInfo = UserLoginModel.fromJson(value.data as Map<String, dynamic>);
      debugPrint(profileInfo!.data!.name.toString());
    }).catchError((e) {
      emit(HomeProfileInfoErrorState());
      debugPrint(e.toString());
      debugPrint(profileInfo!.data!.name.toString());
    });
  }
}
