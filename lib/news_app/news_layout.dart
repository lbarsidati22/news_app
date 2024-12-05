// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/dio_helper.dart';
import 'package:news_app/news_app/cubit/cubit.dart';
import 'package:news_app/news_app/cubit/state.dart';
import 'package:news_app/news_app/screens/search/search_page.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStats>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(),
                      ));
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changAppMode();
                },
                icon: Icon(
                  Icons.brightness_2_sharp,
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
    );
  }
}
