import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImgHistoryWidget extends StatelessWidget {
  ImgHistoryWidget({
    Key? key,
    required this.barkod,
    required this.date,
  }) : super(key: key);

  final String barkod;
  final String date;
  var size, height, width;

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Title'),
        message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Default Action'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Action'),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Destructive Action'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    return SizedBox(
      height: height * 0.15,
      width: width,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
            constraints:
                BoxConstraints(maxWidth: 100, maxHeight: 200, minHeight: 150),
            margin: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://picsum.photos/250?image=9")),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  barkod,
                  style: TextStyle(fontSize: 15, letterSpacing: 2),
                ),
                SizedBox(height: 5),
                Text(
                  date,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                )
              ],
            ),
          ),
          Container(
            child: CupertinoButton(
                child: Icon(
                  CupertinoIcons.delete,
                  size: 15,
                  color: Colors.red,
                ),
                onPressed: () => _showActionSheet(context)),
          )
        ],
      ),
    );
  }
}
