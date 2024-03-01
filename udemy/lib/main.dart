import 'package:flutter/material.dart';
import 'package:udemy/screens/prueba.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeLingo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DynamicQuestionWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
