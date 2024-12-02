// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/dio_helper.dart';
import 'package:news_app/test/test_api/test_dio_helper.dart';
import 'package:news_app/test/test_cubit/test_cubit.dart';
import 'package:news_app/test/test_cubit/test_state.dart';

class TestHomeLayout extends StatelessWidget {
  const TestHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestNewsCubit>(
      create: (context) => TestNewsCubit(),
      child: BlocConsumer<TestNewsCubit, TestNewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TestNewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
              title: Text('News app'),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.testChangeNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.testBottomItem,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                TestDioHelper.getData(url: 'top-headlines', query: {
                  'country': 'us',
                  'category': 'business',
                  'apiKey': 'bbe42778b2a04297b21039c12c152aea',
                }).then((onValue) {
                  print(onValue.data.toString());
                }).catchError((onError) {
                  print(onError.toString());
                });
              },
              child: Icon(Icons.add),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
