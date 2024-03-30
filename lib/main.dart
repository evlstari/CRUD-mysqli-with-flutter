import 'package:flutter/material.dart';
import 'views/home.dart';
import 'load.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'High Array Example',
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
            textTheme: TextTheme(
            ),
            primaryColor: Color(0xFF5399F5),
            hintColor: Color(0xFF00),
            ),
        debugShowCheckedModeBanner: false,
        home: LoadWidget()
    );
  }
}

