import 'dart:convert';

import 'package:barkod/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Items with ChangeNotifier {
  List<HistoryModel> _items = [];

  List<HistoryModel> get items {
    return [..._items];
  }

  HistoryModel findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse(
        'https://barcode-scanner-ef196-default-rtdb.firebaseio.com/items.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(json.decode(response.body));
      if (extractedData == null) {
        return;
      }
      final List<HistoryModel> loadedProducts = [];
      extractedData.forEach((itemId, itemData) {
        loadedProducts.add(HistoryModel(
          id: itemId,
          barcode: itemData['barcode'],
          details: itemData['details'],
          url: itemData['img_url'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(HistoryModel item) async {
    final url = Uri.parse(
        'https://barcode-scanner-ef196-default-rtdb.firebaseio.com/items.json');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'barcode': item.barcode,
          'dateTime': item.dateTime,
          'details': item.details,
          'img_url': item.url,
        }),
      );
      final newItem = HistoryModel(
        barcode: item.barcode,
        details: item.details,
        url: item.url,
        id: json.decode(response.body)['name'],
      );
      _items.add(newItem);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> controlItem(String barcode, value) async {
    final url = Uri.parse(
        'https://barcode-scanner-ef196-default-rtdb.firebaseio.com/items/$barcode.json');
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (value == barcode) {
      print("AAAAAAAAAAAAAAAAAAAAAAAAAA");
    } else {
      print("BBBBBBBBBBBBBBBBBBBBBBBBBB");
    }
  }

  Future<void> getAllCategory(List list) async {
    var url = Uri.parse(
        "https://barcode-scanner-ef196-default-rtdb.firebaseio.com/items/.json");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      list = jsonData;
    }
  }
}
