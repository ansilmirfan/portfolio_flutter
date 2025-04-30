import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupIcons extends StatelessWidget {
  final Axis direction;
  final MainAxisSize mainAxisSize;

  const GroupIcons({
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

  @override
  Widget build(BuildContext context) {
    final icons = [
      IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.github)),
      IconButton(
        onPressed: () {},
        icon: const FaIcon(FontAwesomeIcons.linkedin),
      ),
      IconButton(
        onPressed: () {},
        icon: const FaIcon(FontAwesomeIcons.solidEnvelope),
      ),
    ];

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
