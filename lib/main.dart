import 'package:flutter/material.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/core/utils/app_string.dart';
import 'package:movies/movies/presentation/screens/base.dart';
import 'package:movies/movies/presentation/screens/movie_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),


     home: MainMoviesScreen(),
    );
  }
}


