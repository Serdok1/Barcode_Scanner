// ignore_for_file: prefer_const_constructors

import 'package:barkod/adders/add_employee.dart';
import 'package:barkod/adders/add_item.dart';
import 'package:barkod/barcodescan.dart';
import 'package:barkod/HistoryPage.dart';
import 'package:barkod/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text = "text";
  String time = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Barkod", style: TextStyle(color: Colors.black)),
      ),
      child: Center(child: BarcodeScan()),
    );
  }
}
