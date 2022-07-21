// ignore_for_file: prefer_const_constructors

import 'package:barkod/history_list.dart';
import 'package:barkod/home.dart';
import 'package:barkod/main.dart';
import 'package:barkod/widgets/history_widget.dart';
import 'package:barkod/widgets/imgHistoryWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImgHistory extends StatelessWidget {
  const ImgHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String barkod = "123456789";
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Tarama Geçmişi",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
          border: Border(bottom: BorderSide(color: Colors.white)),
          transitionBetweenRoutes: true,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: ImgHistoryWidget(
                barkod: historyList[index].code,
                date: historyList[index].dateTime,
              ),
            );
          },
          itemCount: historyList.length,
        ));
  }
}
