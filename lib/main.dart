import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item_list_screen.dart';
import 'model.dart';

void main() {
  runApp(
    // ChangeNotifierProvider로 상태 관리 객체를 위젯 트리에 등록
    ChangeNotifierProvider(
      create: (context) => ItemNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ItemListScreen(),
    );
  }
}
