import 'package:flutter/material.dart';

import 'history_list.dart';
import 'widgets/history_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HistoryCard(
            code: historyList[index].code,
            dateTime: historyList[index].dateTime,
          );
        },
        itemCount: historyList.length,
      ),
    );
  }
}
