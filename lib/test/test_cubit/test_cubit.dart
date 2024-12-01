// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/test/pages/busunes.dart';
import 'package:news_app/test/pages/sinance.dart';
import 'package:news_app/test/pages/sports.dart';
import 'package:news_app/test/test_cubit/test_state.dart';

class TestNewsCubit extends Cubit<TestNewsState> {
  TestNewsCubit() : super(TestInitialState());
  static TestNewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    TestBusunes(),
    TestSports(),
    TestSinance(),
  ];
  List<BottomNavigationBarItem> testBottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'science',
    ),
  ];
  void testChangeNavBar(int index) {
    currentIndex = index;
    emit(TestNavBarState());
  }
}
