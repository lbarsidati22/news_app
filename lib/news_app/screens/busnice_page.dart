// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/news_app/cubit/cubit.dart';
import 'package:news_app/news_app/cubit/state.dart';

class BusnicePage extends StatelessWidget {
  const BusnicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStats>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is! NewsGetBusinusLeadingState) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 3,
                );
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                return buildArchivedItem();
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
