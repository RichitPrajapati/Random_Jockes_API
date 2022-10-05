import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_joke_api/Home_Page.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    ),
  );
}

