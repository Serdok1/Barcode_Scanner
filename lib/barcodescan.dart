import 'package:barkod/widgets/scan_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScan extends StatefulWidget {
  const BarcodeScan({Key? key}) : super(key: key);

  @override
  State<BarcodeScan> createState() => _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  String _scanBarcode = '';
  _scan() async {
    return await FlutterBarcodeScanner.scanBarcode(
            "#EB1D36", "İptal", true, ScanMode.BARCODE)
        .then((value) => setState(() => _scanBarcode = value));
  }

  @override
  Widget build(BuildContext context) {
    return ScanCard(
      text: "Tara",
      scan: _scan,
    );
  }
}
