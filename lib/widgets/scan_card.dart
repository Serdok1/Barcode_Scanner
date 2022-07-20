import 'package:barkod/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScanCard extends StatelessWidget {
  ScanCard({Key? key, this.text, this.scan, this.data}) : super(key: key);
  var size, width, height;
  final text;
  final scan;
  final data;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Card(
      child: Container(
        height: height * 0.3,
        width: width * 0.35,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ]),
        child: Center(
            child: CupertinoButton(
                onPressed: () => {scan},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.qrcode_viewfinder, size: 80),
                    Text(
                      text,
                      textScaleFactor: 1,
                    )
                  ],
                ))),
      ),
    );
  }
}
