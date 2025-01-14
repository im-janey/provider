import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),

      // Consumer: 상태를 구독하고, 변경될 때만 관련 UI를 빌드
      body: Consumer<ItemNotifier>(
        builder: (context, itemNotifier, child) {
          return ListView.builder(
            itemCount: itemNotifier.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(itemNotifier.items[index].title),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    itemNotifier.removeItem(index);
                  },
                ),
              );
            },
          );
        },
      ),

      // Provider.of: 상태를 가져오고 업데이트 (listen 여부 설정)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final itemNotifier =
              Provider.of<ItemNotifier>(context, listen: false);
          itemNotifier.addItem('Item ${itemNotifier.items.length + 1}');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
