import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupIcons extends StatelessWidget {
  final Axis direction;

  const GroupIcons({super.key, required this.direction});

  /// Horizontal layout constructor
  factory GroupIcons.horizontal() {
    return GroupIcons(direction: Axis.horizontal);
  }

  /// Vertical layout constructor
  factory GroupIcons.vertical({double spacing = 20.0}) {
    return GroupIcons(direction: Axis.vertical);
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons,
        )
        : Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: icons,
        );
  }
}
