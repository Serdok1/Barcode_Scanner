import 'package:flutter/services.dart';

class Employee {
  final String id;
  final String title;
  final String details;
  final ByteData img;

  Employee(
      {required this.id,
      required this.title,
      required this.details,
      required this.img});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['emp_id'] as String,
        title: json['first_name'] as String,
        details: json['last_name'] as String,
        img: json['img'] as ByteData);
  }
}
