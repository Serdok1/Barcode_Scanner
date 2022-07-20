// ignore_for_file: prefer_const_constructors

import 'package:barkod/barcodescan.dart';
import 'package:barkod/history_list.dart';
import 'package:barkod/models/history_model.dart';
import 'package:barkod/models/history_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    this.value,
  }) : super(key: key);
  final value;

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
        middle: Text("Barkod", style: TextStyle(color: Colors.white)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                historyList
                    .add(HistoryModel(code: widget.value, dateTime: time));
              });
            },
            child: Text(
              "deneme",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Center(child: BarcodeScan()),
          SizedBox(child: HistoryWidget()),
        ],
      ),
    );
  }
}
