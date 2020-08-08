import 'package:flutter/material.dart';
import 'package:mercury/screens/home_screen.dart';
import 'package:mercury/services/ChatServicer.dart';

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
        primaryColor: Color(0xfffb4934),//Color(0xFF689D6A)//aqua//,
        accentColor: Color(0xFF282828),
      ),
      home: HomeScreen(),
    );
  }
}
