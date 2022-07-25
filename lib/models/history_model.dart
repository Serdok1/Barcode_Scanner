import 'package:flutter/material.dart';

class HistoryModel {
  final String barcode;
  final String dateTime;
  final String details;
  final String url;
  final String id;

  const HistoryModel({
    required this.barcode,
    required this.dateTime,
    required this.details,
    required this.url,
    required this.id,
  });
}
