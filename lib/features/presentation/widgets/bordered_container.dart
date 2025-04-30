import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final double padding;
  const BorderedContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      child: child,
    );
  }
}
