import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/animated_icons.dart';

class GroupIcons extends StatelessWidget {
  final Axis direction;
  final MainAxisSize mainAxisSize;

  GroupIcons({
    super.key,
    required this.direction,
    this.mainAxisSize = MainAxisSize.max,
  });

  /// Horizontal layout constructor
  factory GroupIcons.horizontal({
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    return GroupIcons(direction: Axis.horizontal, mainAxisSize: mainAxisSize);
  }

  /// Vertical layout constructor
  factory GroupIcons.vertical({MainAxisSize mainAxisSize = MainAxisSize.max}) {
    return GroupIcons(direction: Axis.vertical, mainAxisSize: mainAxisSize);
  }
  final icons = [AnimIcon.gitHub, AnimIcon.linkedin, AnimIcon.email];

  @override
  Widget build(BuildContext context) {
    return direction == Axis.horizontal
        ? Row(
          spacing: 20,
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons,
        )
        : Column(
          spacing: 20,
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons,
        );
  }
}
