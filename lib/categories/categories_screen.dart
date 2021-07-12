import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/home/home_cubit.dart';
import 'package:shop_abdullah_mansour/home/home_states.dart';
import 'package:shop_abdullah_mansour/models/category_model.dart';
import 'package:shop_abdullah_mansour/share/constant.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final CategoryData? data =
                HomeCubit.get(context).categoryModel!.data;
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: data!.data!.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 5.0),
              itemBuilder: (BuildContext context, int index) =>
                  buildListItem(data, index, context),
            );
          },
        ),
      ),
    );
  }

  Container buildListItem(CategoryData data, int index, BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          buildCategoryImage(data, index, context),
          const SizedBox(width: 15.0),
          Text(data.data![index].name.toString()),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Container buildCategoryImage(
      CategoryData data, int index, BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
      child: Image.network(
        data.data![index].image.toString(),
        fit: BoxFit.fitWidth,
        height: size(context).width / 3.7,
        width: size(context).width / 3.7,
      ),
    );
  }

}
