import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({Key? key, required this.code, required this.dateTime})
      : super(key: key);
  var size, width, height;
  final code;
  final dateTime;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Card(
      child: Container(
        height: height * 0.1,
        width: width * 0.2,
        child: Column(
          children: [
            Text(
              code,
              style: TextStyle(color: Colors.grey.shade800),
            ),
            Text(
              dateTime,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
