import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/home/home_cubit.dart';
import 'package:shop_abdullah_mansour/home/home_states.dart';
import 'package:shop_abdullah_mansour/models/home_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (HomeCubit.get(context).homeModel == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return buildHomeScreen(HomeCubit.get(context).homeModel!);
        },
      ),
    );
  }
}

Widget buildHomeScreen(HomeModel model) => Column(
      children: [
        buildCarouselSlider(model),
        
      ],
    );

CarouselSlider buildCarouselSlider(HomeModel model) {
  return CarouselSlider(
    items: model.data!.banners
        .map((e) => Image(
              fit: BoxFit.cover,
              image: NetworkImage(e.image!),
            ))
        .toList(),
    options: CarouselOptions(
      viewportFraction: 1.0,
      autoPlay: true,
      autoPlayAnimationDuration: const Duration(seconds: 1),
    ),
  );
}
