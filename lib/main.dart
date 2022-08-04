// ignore_for_file: prefer_const_constructors

import 'package:barkod/barcodescan.dart';
import 'package:barkod/details_page.dart';
import 'package:barkod/home.dart';
import 'package:barkod/widgets/menuCard.dart';
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
              primaryContrastingColor: Color.fromARGB(255, 10, 132, 255),
              brightness: Brightness.light,
              primaryColor: Color.fromARGB(255, 255, 214, 10),
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
        drawerShadowsBackgroundColor: Colors.grey.shade200,
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
            MenuCard(),
          ],
        ),
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.close!();
    update();
  }
}
