import 'package:flutter/material.dart';
import 'package:starting_training/app/view/my_homePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Starting Training',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/my_app': (context) => MyApp(),
        });
  }
}
