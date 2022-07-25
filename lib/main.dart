// ignore_for_file: prefer_const_constructors

import 'package:barkod/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: "Barcode Scanner",
        theme: CupertinoThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryContrastingColor: Colors.white,
            brightness: Brightness.light,
            primaryColor: Colors.black,
            barBackgroundColor: Colors.white,
            textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(
              color: Colors.black,
            ))),
        home: /* Home(
        value: value,
      ), */
            Home());
  }
}
