import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final Widget icon;
  final String text;
  const Contact({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 15, children: [icon, SelectableText(text)]);
  }
}
