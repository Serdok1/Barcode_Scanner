import 'dart:convert';

import 'package:barkod/HistoryPage.dart';
import 'package:barkod/main.dart';
import 'package:barkod/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddItem extends StatefulWidget {
  AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var size, height, width;

  String _barcode = "";
  String _details = "";
  String _url = "";

  @override
  Widget build(BuildContext context) {
    Future<void> addProduct() async {
      final url = Uri.parse(
          'https://barcode-scanner-ef196-default-rtdb.firebaseio.com/items.json');
      try {
        final response = await http.post(
          url,
          body: json.encode({
            'barcode': _barcode,
            'details': _details,
            'img_url': _url,
          }),
        );
      } catch (error) {
        print(error);
        throw error;
      }
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => History()));
    }

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return CupertinoPageScaffold(
        child: Container(
      height: height * 0.25,
      width: width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CupertinoTextField(
            placeholder: "Barkod",
            onChanged: (barcode) => _barcode = barcode,
          ),
          CupertinoTextField(
            placeholder: "Açıklama",
            onChanged: (details) => _details = details,
          ),
          CupertinoTextField(
            placeholder: "Görsel Linki",
            onChanged: (details) => _url = details,
          ),
          CupertinoButton.filled(
              child: Text("Kaydet"),
              onPressed: () {
                addProduct();
              })
        ],
      ),
    ));
  }
}
