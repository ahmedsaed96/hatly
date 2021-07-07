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
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final CategoryData? data = HomeCubit.get(context).categoryModel!.data;
          return ListView.separated(
            itemCount: data!.data!.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 5.0);
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.grey.shade200,
                child: Row(
                  children: [
                    Container(
                      foregroundDecoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                      child: Image.network(
                        data.data![index].image.toString(),
                        fit: BoxFit.fitHeight,
                        height: size(context).width / 3.7,
                        width: size(context).width / 3.7,
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Text(data.data![index].name.toString()),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
