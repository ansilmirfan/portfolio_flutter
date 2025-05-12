import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/widgets/horizontal_line.dart';
import 'package:portfolio/features/presentation/widgets/text/hash_text.dart';

class LinedTitle extends StatelessWidget {
  final String title;
  const LinedTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      children: [
        HashText.title(text: title),
        Expanded(child: HorizontalLine()),
      ],
    );
  }
}
