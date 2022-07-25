// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:barkod/item_list.dart';
import 'package:barkod/models/history_model.dart';
import 'package:barkod/widgets/imgHistoryWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ImgHistory extends StatefulWidget {
  ImgHistory({Key? key}) : super(key: key);

  @override
  State<ImgHistory> createState() => _ImgHistoryState();
}

class _ImgHistoryState extends State<ImgHistory> {
  List<HistoryModel> historyList = [];
  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse(
        'https://barcode-scanner-ef196-default-rtdb.firebaseio.com/items/.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<HistoryModel> loadedItems = [];
      extractedData.forEach((itemId, itemData) {
        loadedItems.add(HistoryModel(
            barcode: itemData['barcode'],
            dateTime: DateTime.now.toString(),
            details: itemData['details'],
            url: itemData['url'],
            id: itemId));
      });
      historyList = loadedItems;
    } catch (error) {
      throw (error);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAndSetProducts();
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
      child: ItemList(),
    );
  }
}
