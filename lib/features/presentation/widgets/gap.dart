import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double gap;
  final bool width;
  const Gap({super.key, required this.gap, this.width = false});
  factory Gap.width({required double gap}) {
    return Gap(gap: gap, width: true);
  }

  @override
  Widget build(BuildContext context) {
    if (width) {
      return SizedBox(width: gap);
    } else {
      return SizedBox(height: gap);
    }
  }
}
