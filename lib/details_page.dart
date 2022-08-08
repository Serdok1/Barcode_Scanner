import 'dart:convert';
import 'package:barkod/providers/items.dart';
import 'package:barkod/providers/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => _getEmployees("12"));
  }

  void _getEmployees(String id) {
    Services.getEmployees(id).then((employees) {
      print(employees);
      print("Length ${employees.length}");
      setState(() {
        _employees = employees;
        _isloading = false;
      });
      print(_employees);
    });
    Services.getImage(id).then((value) {
      print(value);
    });
  }

  List<dynamic> _employees = [];
  bool _isloading = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: _isloading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : SafeArea(
              child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.zuhalmuzik.com/images/product/0370910506_1.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  CupertinoButton(
                      child: Icon(CupertinoIcons.back),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailsCard(
                      item: _employees,
                    ),
                    DetailsCard(
                      item: _employees,
                    ),
                  ],
                ),
              ),
            ])),
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    Key? key,
    this.item,
  }) : super(key: key);
  final item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      constraints: const BoxConstraints(
        minHeight: 80,
        minWidth: 250,
        maxHeight: 100,
        maxWidth: 350,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(5, 4),
          )
        ],
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 10, 132, 255),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item[0]['first_name']),
            Text(item[0]['last_name']),
            Text(item[0]['id'])
          ],
        ),
      ),
    );
  }
}
