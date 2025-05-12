import 'package:flutter/material.dart';

class DotContainer extends StatelessWidget {
  final int row;
  final int column;
  final double spacing;
  const DotContainer({
    super.key,
    required this.row,
    required this.column,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing,
      children: [
        for (int i = 1; i <= column; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: List.generate(
              row,
              (index) => Container(
                width: 4,
                height: 4,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
      ],
    );
  }
}
