import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_app/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const NewsLayout(),
    );
  }
}
