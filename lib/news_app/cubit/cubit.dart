// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_app/cubit/state.dart';
import 'package:news_app/news_app/screens/busnice_page.dart';
import 'package:news_app/news_app/screens/settings_page.dart';
import 'package:news_app/news_app/screens/sinance_page.dart';
import 'package:news_app/news_app/screens/sports_page.dart';

class NewsCubit extends Cubit<NewsStats> {
  NewsCubit() : super(NewsInitiaiState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    BusnicePage(),
    SportsPage(),
    SinancePage(),
    SettingsPage(),
  ];
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'settings',
    ),
  ];
  void changNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }
}
