import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImgHistory extends StatelessWidget {
  const ImgHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SizedBox(
      child: Card(
          child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.all(20),
            child: Image(fit: BoxFit.fill, image: NetworkImage("")),
          ),
          Column(
            children: [Text("data"), Text("data")],
          ),
        ],
      )),
    ));
  }
}
