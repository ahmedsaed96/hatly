import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/home/home_cubit.dart';
import 'package:shop_abdullah_mansour/home/home_states.dart';
import 'package:shop_abdullah_mansour/models/get_favorites_model.dart';
import 'package:shop_abdullah_mansour/share/constant.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final OnlineFavorites? favorites =
                HomeCubit.get(context).onlineFavorites;
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: favorites!.data!.innerData!.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 5.0),
              itemBuilder: (BuildContext context, int index) =>
                  buildListItem(favorites, index, context),
            );
          },
        ),
      ),
    );
  }

  Container buildListItem(
      OnlineFavorites data, int index, BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          buildCategoryImage(data, index, context),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size(context).width / 1.5,
                child: Text(
                  data.data!.innerData![index].product!.name.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                width: size(context).width / 1.5,
                child: Row(
                  children: [
                    Text(
                      '${data.data!.innerData![index].product!.price}',
                      style: const TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(width: 10.0),
                    if (data.data!.innerData![index].product!.discount != 0)
                      Text(
                        '${data.data!.innerData![index].product!.oldPrice}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          HomeCubit.get(context).addOrDeleteFromFavorites(
                              // ignore: cast_nullable_to_non_nullable
                              data.data!.innerData![index].product!.id as int);
                          debugPrint(data.data!.innerData![index].product!.id
                              .toString());
                        },
                        child: Icon(
                          // model.data!.products[index].inFavorites!
                          HomeCubit.get(context).favorites[
                                  data.data!.innerData![index].product!.id]!
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: HomeCubit.get(context).favorites[
                                  data.data!.innerData![index].product!.id]!
                              ? primaryColor
                              : defaultColor,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildCategoryImage(
      OnlineFavorites data, int index, BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
      child: Image.network(
        data.data!.innerData![index].product!.image.toString(),
        fit: BoxFit.fitHeight,
        height: size(context).width / 3.7,
        width: size(context).width / 3.7,
      ),
    );
  }
}
