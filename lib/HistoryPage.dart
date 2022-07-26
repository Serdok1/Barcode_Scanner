// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:barkod/widgets/item_list.dart';
import 'package:barkod/models/history_model.dart';
import 'package:barkod/providers/items.dart';
import 'package:barkod/widgets/imgHistoryWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var _isLoading = false;
  var _isInit = true;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Items>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Tarama Geçmişi",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )),
        border: Border(bottom: BorderSide(color: Colors.white)),
        transitionBetweenRoutes: true,
      ),
      child: _isLoading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : ItemList(),
    );
  }
}
