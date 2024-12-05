// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/cache_helper.dart';
import 'package:news_app/api/dio_helper.dart';
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
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> busnice = [];
  void getBusnice() {
    emit(NewsGetBusinusLeadingState());
    DioHelper.getData(
      url: 'top-headlines',
      quiry: {
        'country': 'us',
        'category': 'business',
        'apiKey': 'bbe42778b2a04297b21039c12c152aea',
      },
    ).then((onValue) {
      // print(onValue.data.toString());
      busnice = onValue.data['articles'];
      print(busnice[0]['title']);
      emit(NewsGetBusinusSuccecsState());
    }).catchError((onError) {
      print(onError.toString());
      NewsGetBusinusErrotState(error: onError.toString());
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLeadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'top-headlines',
        quiry: {
          'country': 'us',
          'category': 'sports',
          'apiKey': 'bbe42778b2a04297b21039c12c152aea',
        },
      ).then((onValue) {
        // print(onValue.data.toString());
        sports = onValue.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccecsState());
      }).catchError((onError) {
        print(onError.toString());
        NewsGetSportsErrotState(error: onError.toString());
      });
    } else {
      emit(NewsGetSportsSuccecsState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetSeinanceLeadingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'top-headlines',
        quiry: {
          'country': 'us',
          'category': 'Science',
          'apiKey': 'bbe42778b2a04297b21039c12c152aea',
        },
      ).then((onValue) {
        // print(onValue.data.toString());
        science = onValue.data['articles'];
        print(science[0]['title']);
        emit(NewsGetSeinanceSuccecsState());
      }).catchError((onError) {
        print(onError.toString());
        NewsGetSeinanceErrotState(error: onError.toString());
      });
    } else {
      emit(NewsGetSeinanceSuccecsState());
    }
  }

  bool isDark = false;

  void changAppMode() {
    isDark = !isDark;
    emit(NewsDarkModeState());
  }
}
