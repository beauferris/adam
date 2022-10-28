import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/stepper/stepper.dart';

import 'package:myapp/app/home.dart';
import 'package:myapp/stepper/stepper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
          fontFamily: 'Raleway',
          scaffoldBackgroundColor: const Color.fromRGBO(235, 235, 235, 1),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(8, 44, 151, 1),
              selectedItemColor: Color.fromRGBO(235, 235, 235, 1),
              unselectedItemColor: Color.fromRGBO(235, 235, 235, 1)),
          appBarTheme:
              const AppBarTheme(backgroundColor: Color.fromRGBO(8, 44, 151, 1)),
        ));
  }
}
