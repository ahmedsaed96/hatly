import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/cache/cache_helper.dart';
import 'package:shop_abdullah_mansour/dio_helper/dio_helper.dart';
import 'package:shop_abdullah_mansour/dio_helper/end_points.dart';
import 'package:shop_abdullah_mansour/models/search_model.dart';
import 'package:shop_abdullah_mansour/search/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchIntialState());
  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();
  SearchModel? searchModel;
  void serach(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      sEARCH,
      {'text': text},
      token: CacheHelper.getString(key: 'token'),
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data as Map<String, dynamic>);
      debugPrint(value.data.toString());
      emit(SearchSuccesState());
    }).catchError((e) {
      debugPrint('error from serach func $e');
      emit(SearcherrorState());
    });
  }
}
