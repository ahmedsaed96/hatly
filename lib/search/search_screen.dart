import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_abdullah_mansour/models/search_model.dart';
import 'package:shop_abdullah_mansour/search/search_cubit.dart';
import 'package:shop_abdullah_mansour/search/search_states.dart';
import 'package:shop_abdullah_mansour/share/constant.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchAppbar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(),
          child: BlocConsumer<SearchCubit, SearchStates>(
            listener: (context, state) {},
            builder: (context, state) {
              //search is not perfect ther is unknowen error neded to resolve
              return Column(
                children: [
                  if (State is SearchLoadingState)
                    const LinearProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: const InputDecoration(
                          labelText: 'Enter text to search',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                      onSubmitted: (text) {
                        if (text.isNotEmpty) {
                          SearchCubit.get(context).serach(
                              SearchCubit.get(context).searchController.text);
                        } else {
                          return;
                        }
                      },
                    ),
                  ),
                  if (SearchCubit.get(context).searchModel != null)
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: SearchCubit.get(context)
                            .searchModel!
                            .data!
                            .data!
                            .length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 5.0),
                        itemBuilder: (BuildContext context, int index) =>
                            buildListItem(SearchCubit.get(context).searchModel!,
                                index, context),
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  AppBar buildSearchAppbar() {
    return AppBar(
      iconTheme: IconThemeData(color: primaryColor),
      title: const Text(
        'Search',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  Container buildListItem(SearchModel data, int index, BuildContext context) {
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
                  data.data!.data![index].name!.toString(),
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
                      '${data.data!.data![index].price}',
                      style: const TextStyle(color: Colors.blue),
                    ),
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
      SearchModel data, int index, BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
      child: Image.network(
        data.data!.data![index].image.toString(),
        fit: BoxFit.fitHeight,
        height: size(context).width / 3.7,
        width: size(context).width / 3.7,
      ),
    );
  }
}
