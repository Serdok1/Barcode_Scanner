import 'package:barkod/main.dart';
import 'package:barkod/providers/details_page.dart';
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

  _scan() async {
    scanBarcodeNormal();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<HistoryModel>(context, listen: false);
    Navigator.of(context).pushNamed(
      DetailsPage.routeName,
      arguments: product.id,
    );
    return ScanCard(
      scan: _scan,
    );
  }
}
