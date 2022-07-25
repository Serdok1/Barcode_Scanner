import 'package:barkod/models/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:barkod/models/history_model.dart';

class Items with ChangeNotifier {
  List<HistoryModel> _historyList = [];
  List<HistoryModel> get items {
    return [..._historyList];
  }

  HistoryModel findById(String id) {
    return items.firstWhere((item) => item.id == id);
  }

  void addItem() {
    /* _historyList.add(value); */
    notifyListeners();
  }
}
