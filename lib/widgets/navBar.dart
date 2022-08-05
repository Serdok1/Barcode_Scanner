import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavBar extends StatelessWidget {
  const NavBar(
      {Key? key, required this.text, required this.icon, required this.func})
      : super(key: key);
  final String text;
  final IconData icon;
  final func;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            child:
                CupertinoButton(child: Icon(icon), onPressed: () => {func()})),
        Container(
          margin: EdgeInsets.only(right: 10),
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
