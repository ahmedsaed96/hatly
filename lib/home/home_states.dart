import 'package:shop_abdullah_mansour/models/change_favorites_model.dart';

abstract class HomeStates {}

class HomeIntialState extends HomeStates {}

class HomeChangeIndexState extends HomeStates {}

class HomeProductsLoadingState extends HomeStates {}

class HomeProductsSuccesState extends HomeStates {}

class HomeProductsErrorState extends HomeStates {}

class HomeCategorySuccessState extends HomeStates {}

class HomeCategoryErrorState extends HomeStates {}

class HomeChangeFavoriteSuccessState extends HomeStates {}

class HomeChangeFavoriteErrorState extends HomeStates {}

class HomeChangeLocalFavoriteSuccessState extends HomeStates {}

class HomeChangeLocalFavoriteErrorState extends HomeStates {
  ChangeFavoriteModel? favoriteModel;
}

class HomeOnlineFavoritesLisLoadingState extends HomeStates {}

class HomeOnlineFavoritesLisSuccesState extends HomeStates {}

class HomeOnlineFavoritesLisErrorState extends HomeStates {}

class HomeProfileInfoLoadingState extends HomeStates {}

class HomeProfileInfoSuccesState extends HomeStates {}

class HomeProfileInfoErrorState extends HomeStates {}
