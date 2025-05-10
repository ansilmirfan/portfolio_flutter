import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';

class AnimationIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback ontap;
  final Color color;

  const AnimationIcon({
    super.key,
    required this.icon,
    required this.ontap,
    required this.color,
  });

  @override
  State<AnimationIcon> createState() => _AnimationIconState();
}

class _AnimationIconState extends State<AnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnim;
  late Animation<double> rotationAnim1;
  late Animation<double> rotationAnim2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    scaleAnim = Tween<double>(begin: 1.0, end: 1.5).animate(controller);
    rotationAnim1 = Tween<double>(begin: 0.0, end: 0.25).animate(controller);
    rotationAnim2 = Tween<double>(begin: 0.0, end: -0.25).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHovering) {
        isHovering ? controller.forward() : controller.reverse();
      },
      onTap: () {
        controller.forward().then((value) => controller.reverse());
        widget.ontap();
      },
      child: ClipRect(
        clipBehavior: Clip.none,
        child: SizedBox(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  BackgroundBox(
                    turns: rotationAnim1,
                    scale: scaleAnim,
                    size: 30,
                    padding: 0.8,
                    color: widget.color,
                  ),
                  BackgroundBox(
                    turns: rotationAnim2,
                    scale: scaleAnim,
                    size: 25,
                    padding: 1.5,
                    color: widget.color,
                  ),
                  const RotatedBaseBox(),
                  Icon(widget.icon, size: 20, color: widget.color),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BackgroundBox extends StatelessWidget {
  final Animation<double> turns;
  final Animation<double> scale;
  final double size;
  final double padding;
  final Color color;

  const BackgroundBox({
    super.key,
    required this.turns,
    required this.scale,
    required this.size,
    required this.padding,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: turns,
      child: ScaleTransition(
        scale: scale,
        child: Container(
          color: color,
          height: size,
          width: size,
          padding: EdgeInsets.all(padding),
          child: Container(color: AppColors.bgColor),
        ),
      ),
    );
  }
}

class RotatedBaseBox extends StatelessWidget {
  const RotatedBaseBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 4,
      child: Container(color: AppColors.bgColor, height: 34, width: 34),
    );
  }
}
