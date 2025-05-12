import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const FloatingButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      mini: true,
      child: Icon(icon),
    );
  }
}
