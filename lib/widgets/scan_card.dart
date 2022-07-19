import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScanCard extends StatelessWidget {
  ScanCard({Key? key, this.text, this.scan}) : super(key: key);
  var size, width, height;
  final text;
  final scan;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Card(
      child: Container(
        height: height * 0.3,
        width: width * 0.3,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ]),
        child: Center(
            child: TextButton(
                onPressed: () => scan,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code, size: 80),
                    Text(
                      text,
                      textScaleFactor: 1.5,
                    )
                  ],
                ))),
      ),
    );
  }
}
