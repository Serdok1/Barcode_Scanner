import 'package:flutter/material.dart';
import '../history_list.dart';
import '../widgets/history_card.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  var size, width, height;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Container(
      height: height * 0.15,
      width: width * 0.90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return HistoryCard(
            code: historyList[index].code,
            dateTime: historyList[index].dateTime,
          );
        },
        itemCount: historyList.length,
        reverse: true,
        addRepaintBoundaries: true,
      ),
    );
  }
}
