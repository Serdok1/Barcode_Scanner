import 'package:barkod/models/history_model.dart';
import 'package:barkod/providers/items.dart';
import 'package:barkod/widgets/history_card.dart';
import 'package:barkod/widgets/imgHistoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context);
    final items = itemsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: items.length,
      itemBuilder: (ctx, i) => ImgHistoryWidget(
        barkod: items[i].barcode,
        date: DateTime.now().toString(),
        details: items[i].details,
        url: items[i].url,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
