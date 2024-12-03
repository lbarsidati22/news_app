// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/news_app/cubit/cubit.dart';
import 'package:news_app/news_app/cubit/state.dart';

class SinancePage extends StatelessWidget {
  const SinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStats>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var articles = NewsCubit.get(context).science;
        if (articles.length > 0) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 3,
                );
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                return buildArchivedItem(articles[index]);
              });
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        );
      },
    );
  }
}
