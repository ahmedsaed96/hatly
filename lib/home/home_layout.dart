import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/home/home_cubit.dart';
import 'package:shop_abdullah_mansour/home/home_states.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: buildAppbar(),
        body:
            HomeCubit.get(context).screens[HomeCubit.get(context).currentIndex],
        bottomNavigationBar: buildButtomNavBar(context),
      ),
    );
  }

  BottomNavigationBar buildButtomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: HomeCubit.get(context).currentIndex,
      onTap: (index) => HomeCubit.get(context).changeIndex(index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text(
        'Hatly',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
    );
  }
}
