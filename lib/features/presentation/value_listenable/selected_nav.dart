import 'package:flutter/widgets.dart';

class SelectedNav {
  static ValueNotifier<int> selectedNav = ValueNotifier(0);
  static update(int index) {
    selectedNav.value = index;
  }
}
