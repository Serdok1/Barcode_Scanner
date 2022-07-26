import 'package:barkod/providers/items.dart';

import 'package:barkod/widgets/imgHistoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context);
    final items = itemsData.items;
    return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: items.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: items[i],
              child: ImgHistoryWidget(),
            ));
  }
}
