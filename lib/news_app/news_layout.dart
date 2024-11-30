// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/dio_helper.dart';
import 'package:news_app/news_app/cubit/cubit.dart';
import 'package:news_app/news_app/cubit/state.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStats>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                DioHelper.getData(
                  url: 'top-headlines',
                  quiry: {
                    'country': 'us',
                    'category': 'business',
                    'apiKey': 'bbe42778b2a04297b21039c12c152aea',
                  },
                ).then((onValue) {
                  print(onValue.data.toString());
                }).catchError((onError) {
                  print(onError.toString());
                });
              },
              child: Icon(
                Icons.add,
              ),
            ),
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
                cubit.changNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItem,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
