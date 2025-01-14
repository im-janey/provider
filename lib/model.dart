import 'package:flutter/material.dart';

import 'item.dart';

// ItemNotifier 클래스 정의 (상태 관리)
class ItemNotifier with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items; // 현재 상태를 가져오는 getter

  void addItem(String title) {
    _items.add(Item(title));
    notifyListeners(); // 상태 변경 알림
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners(); // 상태 변경 알림
  }
}
