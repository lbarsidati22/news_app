// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/news_app/cubit/cubit.dart';
import 'package:news_app/news_app/cubit/state.dart';
import 'package:news_app/test/test_items.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStats>(
      listener: (context, state) {},
      builder: (context, state) {
        final list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'search most nto be empty';
                    }
                    return '';
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                    label: Text('Search'),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 3,
                      );
                    },
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return buildArchivedItem(list[index]);
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
