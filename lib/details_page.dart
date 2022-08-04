import 'dart:convert';
import 'package:barkod/providers/items.dart';
import 'package:barkod/providers/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import './providers/items.dart';
import 'models/employee.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);
  static const routeName = '/product-detail';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getEmployees());
  }

  void _getEmployees() {
    Services.getEmployees().then((employees) {
      print(employees);
      print("Length ${employees.length}");
      setState(() {
        _employees = employees;
      });
      print(_employees);
    });
  }

  List<dynamic> _employees = [];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Column(
      children: [
        Text(_employees[0]['id']),
        Text(_employees[0]['first_name']),
        Text(_employees[0]['last_name']),
      ],
    ));
  }
}
