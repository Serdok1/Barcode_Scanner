import 'dart:convert';
import 'package:barkod/providers/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, this.barcode}) : super(key: key);
  static const routeName = '/product-detail';
  final barcode;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List categoryItemList = [];

  @override
  Widget build(BuildContext context) {
    Future<void> controlItem(String barcode, value) async {
      final url = Uri.parse(
          'https://barcode-scanner-ef196-default-rtdb.firebaseio.com/items/$barcode.json');
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (value == barcode) {
        print("AAAAAAAAAAAAAAAAAAAAAAAAAA");
      } else {
        print(json.decode(response.body)['barcode']);
      }
    }

    Future getAllCategory() async {
      var url = Uri.parse(
          "https://barcode-scanner-ef196-default-rtdb.firebaseio.com/items/.json");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          categoryItemList = jsonData;
        });
        print(categoryItemList);
      }
    }

    @override
    void initState() {
      super.initState();
      getAllCategory();
    }

    /* final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Items>(
      context,
      listen: false,
    ).findById(productId); */
    return CupertinoPageScaffold(
      child: Container(
        child: CupertinoButton.filled(
            child: Text("deneme"),
            onPressed: () {
              /* controlItem(); */
            }),
      ),
      navigationBar: CupertinoNavigationBar(),
    );
  }
}
