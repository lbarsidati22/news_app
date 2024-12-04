// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/test/test_cubit/test_cubit.dart';
import 'package:news_app/test/test_cubit/test_state.dart';
import 'package:news_app/test/test_items.dart';

class TestSports extends StatelessWidget {
  const TestSports({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestNewsCubit, TestNewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var articles = TestNewsCubit.get(context).sports;
        if (state is! TestSportsLeadingSatete) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return testarchivedItem(articles[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 3,
              );
            },
            itemCount: 6,
          );
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
