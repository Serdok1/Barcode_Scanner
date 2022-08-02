// ignore_for_file: prefer_const_constructors

import 'package:barkod/barcodescan.dart';
import 'package:barkod/details_page.dart';
import 'package:barkod/home.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:barkod/providers/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

void main() {
  runApp(MyApp());
  Get.put<MyDrawerController>(MyDrawerController());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Items(),
        ),
      ],
      child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: "Barcode Scanner",
          theme: CupertinoThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryContrastingColor: Colors.yellow,
              brightness: Brightness.light,
              primaryColor: Colors.black,
              barBackgroundColor: Color.fromARGB(255, 10, 132, 255),
              textTheme: CupertinoTextThemeData(
                  textStyle: TextStyle(
                color: Colors.black,
              ))),
          routes: {DetailsPage.routeName: (ctx) => DetailsPage()},
          home: MyHomePage()),
    );
  }
}

class MyHomePage extends GetView<MyDrawerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: MenuScreen(),
        mainScreen: Home(),
        borderRadius: 20.0,
        showShadow: true,
        angle: 0.0,
        openCurve: const Interval(0.0, 1.0, curve: Curves.easeOut),
        menuBackgroundColor: Color.fromARGB(255, 255, 214, 10),
        drawerShadowsBackgroundColor: Color.fromARGB(255, 10, 132, 255),
        slideWidth: MediaQuery.of(context).size.width * 0.65,
      ),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Selections_Card(),
          ],
        ),
      ),
    );
  }
}

class Selections_Card extends StatelessWidget {
  const Selections_Card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(5, 4),
            ),
          ]),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}
