import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/home/home_cubit.dart';
import 'package:shop_abdullah_mansour/home/home_states.dart';
import 'package:shop_abdullah_mansour/models/category_model.dart';
import 'package:shop_abdullah_mansour/models/home_model.dart';
import 'package:shop_abdullah_mansour/share/constant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (HomeCubit.get(context).homeModel == null ||
              HomeCubit.get(context).categoryModel == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return buildHomeScreen(HomeCubit.get(context).homeModel!,
              HomeCubit.get(context).categoryModel!, context);
        },
      ),
    );
  }
}

Widget buildHomeScreen(
        HomeModel model, CategoryModel categoryModel, BuildContext context) =>
    SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCarouselSlider(model),
          const SizedBox(height: 15.0),
          buildHeaderText('Categories'),
          buildCategorList(context, categoryModel),
          const SizedBox(height: 13.0),
          buildHeaderText('New Products'),
          buildGridView(model)
        ],
      ),
    );

Padding buildHeaderText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Text(
      text,
      style: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.w500),
    ),
  );
}

Padding buildCategorList(BuildContext context, CategoryModel categoryModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: SizedBox(
      height: size(context).width / 3,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    foregroundDecoration: BoxDecoration(
                        //amazing idea
                        color: Colors.grey.withOpacity(0.2)),
                    height: size(context).width / 3.7,
                    width: size(context).width / 3.7,
                    child: Image.network(
                      categoryModel.data!.data![index].image.toString(),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.6),
                    width: size(context).width / 4,
                    height: size(context).height / 35,
                    child: Text(
                      categoryModel.data!.data![index].name.toString(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10.0,
              ),
          itemCount: categoryModel.data!.data!.length),
    ),
  );
}

GridView buildGridView(HomeModel model) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 1.0,
      childAspectRatio: 1 / 1.4,
    ),
    itemBuilder: (context, index) => buildGridViewItems(model, index),
    itemCount: model.data!.products.length,
  );
}

Column buildGridViewItems(HomeModel model, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              // ignore: unnecessary_string_interpolations
              '${model.data!.products[index].image}',
              height: 150.0,
            ),
            if (model.data!.products[index].discount != 0) buildDiscount(),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // ignore: unnecessary_string_interpolations
              '${model.data!.products[index].name}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10.0),
            buildPriceRow(model, index)
          ],
        ),
      ),
    ],
  );
}

Row buildPriceRow(HomeModel model, int index) {
  return Row(
    children: [
      Text(
        '${model.data!.products[index].price}',
        style: TextStyle(color: defaultColor),
      ),
      const SizedBox(width: 10.0),
      if (model.data!.products[index].discount != 0)
        Text(
          '${model.data!.products[index].oldPrice}',
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
          onTap: () {},
          child: const Icon(Icons.favorite_border),
        ),
      ),
    ],
  );
}

Container buildDiscount() {
  return Container(
    color: Colors.red.shade400,
    child: const Text(
      ' DISCOUNT ',
      style: TextStyle(color: Colors.white),
    ),
  );
}

CarouselSlider buildCarouselSlider(HomeModel model) {
  return CarouselSlider(
    items: model.data!.banners
        .map((e) => Image(
              fit: BoxFit.cover,
              image: NetworkImage(e.image!),
            ))
        .toList(),
    options: CarouselOptions(
      height: 190.0,
      viewportFraction: 1.0,
      autoPlay: true,
      autoPlayAnimationDuration: const Duration(seconds: 1),
    ),
  );
}
