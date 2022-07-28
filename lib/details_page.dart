import 'dart:convert';
import 'package:barkod/providers/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import './providers/items.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, this.barcode}) : super(key: key);
  static const routeName = '/product-detail';
  final barcode;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List itemlist = [];
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      Provider.of<Items>(context).getAllCategory(itemlist);
    }

    return CupertinoPageScaffold(
      child: Container(
        child: CupertinoButton.filled(
            child: Text("deneme"),
            onPressed: () {
              /* controlItem(); */
            }),
      ),
      navigationBar: CupertinoNavigationBar(),
    );
  }
}
