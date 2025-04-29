import 'package:flutter/material.dart';

extension Propotion on double {
  double multiply(double factor) => this * factor;
}

//extension on BuildContext for naviagation Purposes
extension Navigation on BuildContext {
  void pop() => Navigator.of(this).pop();
  void push(Widget page) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
}
