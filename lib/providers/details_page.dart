import 'package:barkod/providers/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Items>(
      context,
      listen: false,
    ).findById(productId);
    return CupertinoPageScaffold(
      child: Container(),
      navigationBar:
          CupertinoNavigationBar(middle: Text(loadedProduct.barcode)),
    );
  }
}
