import 'package:flutter/material.dart';
import 'package:starting_training/app/view/my_homePage.dart';
import 'package:starting_training/app/view/registrationUserPage.dart';
import 'package:starting_training/app/view/userPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Starting Training',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => MyHomePage(title: "StratTrianing"),
          '/userPage': (context) => UserPage(),
          '/registrationUserPage': (context) => RegistrationUserPage(),
        });
  }
}
