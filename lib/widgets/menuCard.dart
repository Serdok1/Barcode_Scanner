import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.5,
          margin: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(5, 4),
                ),
              ]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 5,
                ),
                CupertinoButton(
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.qrcode_viewfinder),
                      Text(
                        "Barkod Tarayıcı",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                CupertinoButton(
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.arrow_counterclockwise_circle),
                      Text("Tarama Geçmişi",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  onPressed: () {},
                ),
                CupertinoButton(
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.add_circled),
                        Text("Ürün Ekleme",
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    onPressed: () {}),
                SizedBox(
                  height: 15,
                )
              ]),
        ),
        Text(
          "Developed by Sina Eren Özbayram",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        )
      ],
    );
  }
}
