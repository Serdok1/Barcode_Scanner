import 'dart:convert';

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
  const BarcodeScan({Key? key}) : super(key: key);

  @override
  State<BarcodeScan> createState() => _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  String _scanBarcode = 'Unknown';

  void initState() {
    super.initState();
  }

  String barcodeScanRes = "";
  String res = "";
  Future<void> scanBarcodeNormal() async {
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    setState(() {
      res = barcodeScanRes;
    });
    if (!mounted) return;
  }

  _scan() async {
    scanBarcodeNormal();
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: ((context) => DetailsPage(
                  barcode: res,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return ScanCard(
      scan: _scan,
    );
  }
}
