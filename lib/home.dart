import 'package:barkod/barcodescan.dart';
import 'package:barkod/history_list.dart';
import 'package:barkod/models/history_model.dart';
import 'package:barkod/history_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  String text = "text";
  String time = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                historyList.add(HistoryModel(code: text, dateTime: time));
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const HistoryPage()));
              },
              child: Text("deneme")),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            BarcodeScan(),
          ]),
        ],
      ),
      appBar: AppBar(
        title: Text("Barkod"),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
