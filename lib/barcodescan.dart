import 'dart:convert';
import 'package:barkod/widgets/scan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'adders/add_employee.dart';
import 'providers/services.dart';

class BarcodeScan extends StatefulWidget {
  BarcodeScan({Key? key}) : super(key: key);

  String res = "123";
  @override
  State<BarcodeScan> createState() => _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  String demo = "test";
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
    }

    void checkID(String id) {
      (Services.checkId(id).then((value) {
        final bool isexist = value.contains("notexist");
        if (isexist == true) {
          Navigator.push(context,
              CupertinoPageRoute(builder: ((context) => AddEmployee())));
        } else if (isexist == false) {
          print("object");
        }
      }));
    }

    /*  Future<void> scanBarcodeNormal() async {
      String barcodeScanRes = "";
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      } on PlatformException {
        barcodeScanRes = 'Failed to get platform version.';
      }

      setState(() {
        checkID(barcodeScanRes);
      });

      if (!mounted) return;
    } */

    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  CupertinoIcons.equal_circle,
                  color: Colors.black54,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [Icon(CupertinoIcons.qrcode), Text("Barcode")],
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.amberAccent),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: ScanCard(scan: () {
              checkID("123");
            }),
          ),
        ],
      ),
    );
  }
}
