import 'package:barkod/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScanCard extends StatelessWidget {
  ScanCard({
    Key? key,
    this.scan,
  }) : super(key: key);
  var size, width, height;
  final scan;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      height: 200,
      width: 200,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
        BoxShadow(
          color: Colors.grey.shade600,
          spreadRadius: 0,
          blurRadius: 6,
          offset: const Offset(5, 4),
        ),
        BoxShadow(
          color: Color.fromRGBO(242, 242, 247, 1),
          offset: const Offset(0, 0),
        )
      ]),
      child: Center(
          child: CupertinoButton(
              onPressed: () => {scan()},
              child: Icon(
                CupertinoIcons.qrcode_viewfinder,
                size: 100,
                color: Colors.black,
              ))),
    );
  }
}
