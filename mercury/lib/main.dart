import 'package:flutter/material.dart';
import 'package:mercury/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercury',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff1d2021), //Color(0xFF689D6A)//aqua//,
        accentColor: Color(0xFF282828),
        fontFamily: 'FiraCode',
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Color(0xff32302f),
          displayColor: Color(0xff32302f),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
