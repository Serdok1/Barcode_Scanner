import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Icon(
            CupertinoIcons.equal_circle,
            color: Colors.black54,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: 40,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.qrcode, color: Colors.black),
              Text(text)
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.amberAccent),
        ),
      ],
    );
  }
}
