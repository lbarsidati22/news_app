// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/test/pages/busunes.dart';
import 'package:news_app/test/pages/sinance.dart';
import 'package:news_app/test/pages/sports.dart';
import 'package:news_app/test/test_api/test_dio_helper.dart';
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

  List<dynamic> business = [];
  void getBusiness() {
    emit(TestBusunesLeadingSatete());
    TestDioHelper.getData(url: 'top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'bbe42778b2a04297b21039c12c152aea',
    }).then((onValue) {
      business = onValue.data['articles'];
      print(business[0]['title']);
      emit(TestBusunesSuccunseSatete());
    }).catchError((onError) {
      print(onError.toString());
      emit(TestBusunesErrorSatete(error: onError.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(TestSportsLeadingSatete());
    TestDioHelper.getData(url: 'top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': 'bbe42778b2a04297b21039c12c152aea',
    }).then((onValue) {
      sports = onValue.data['articles'];
      print(sports[0]['title']);
      emit(TestSportsSuccunseSatete());
    }).catchError((onError) {
      print(onError.toString());
      emit(TestSportsErrorSatete(error: onError.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(TestSeinanceLeadingSatete());
    TestDioHelper.getData(url: 'top-headlines', query: {
      'country': 'us',
      'category': 'Science',
      'apiKey': 'bbe42778b2a04297b21039c12c152aea',
    }).then((onValue) {
      science = onValue.data['articles'];
      print(science[0]['title']);
      emit(TestSeinanceSuccunseSatete());
    }).catchError((onError) {
      print(onError.toString());
      emit(TestSeinanceErrorSatete(error: onError.toString()));
    });
  }
}
