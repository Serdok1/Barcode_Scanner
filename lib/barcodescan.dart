import 'dart:convert';
import 'package:barkod/details_page.dart';
import 'package:barkod/widgets/imgHistoryWidget.dart';
import 'package:barkod/widgets/item_list.dart';
import 'package:barkod/widgets/navBar.dart';
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
          Navigator.push(context,
              CupertinoPageRoute(builder: ((context) => DetailsPage())));
        }
      }));
    }

    func() {
      ZoomDrawer.of(context)?.open();
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

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavBar(
            text: "Barkod Okut",
            icon: CupertinoIcons.equal_circle,
            func: func,
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: ScanCard(scan: () {
              checkID("999");
            }),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(-2, -2),
                      spreadRadius: 0,
                      color: Colors.grey,
                      blurRadius: 5,
                      blurStyle: BlurStyle.inner)
                ]),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                  HistoryWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(5, 4),
            ),
          ]),
    );
  }
}
