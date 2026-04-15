import 'package:flutter/material.dart';
import 'LoginTest.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginTest(),
      },
    ),
  );
}