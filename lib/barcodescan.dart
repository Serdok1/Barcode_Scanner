import 'dart:convert';

import 'package:barkod/adders/add_employee.dart';
import 'package:barkod/adders/add_item.dart';
import 'package:barkod/main.dart';
import 'package:barkod/details_page.dart';
import 'package:barkod/widgets/scan_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'HistoryPage.dart';
import 'models/history_model.dart';

class BarcodeScan extends StatefulWidget {
  BarcodeScan({Key? key}) : super(key: key);

  String res = "123";
  @override
  State<BarcodeScan> createState() => _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
    }

    Future<void> scanBarcodeNormal() async {
      String barcodeScanRes = "";
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      } on PlatformException {
        barcodeScanRes = 'Failed to get platform version.';
      }

      setState(() {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: ((context) => AddEmployee(/* id: barcodeScanRes */))));
      });

      if (!mounted) return;
    }

    return ScanCard(
      scan: scanBarcodeNormal,
    );
  }
}
