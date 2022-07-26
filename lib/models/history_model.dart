import 'package:flutter/material.dart';

class HistoryModel with ChangeNotifier {
  final String barcode;
  final String dateTime = DateTime.now().toString();
  final String details;
  final String url;
  final String id;

  HistoryModel({
    required this.barcode,
    required this.details,
    required this.url,
    required this.id,
  });
}
