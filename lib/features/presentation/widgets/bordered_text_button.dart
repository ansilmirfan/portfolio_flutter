import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';

class BorderedTextButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final bool dark;
  final bool mini;
  const BorderedTextButton({
    super.key,
    required this.onTap,
    this.dark = false,
    required this.text,
    this.mini = false,
  });
  //factor constructor dark for grey look
  factory BorderedTextButton.dark({
    required VoidCallback onTap,
    required String text,
  }) {
    return BorderedTextButton(onTap: onTap, text: text, dark: true);
  }
  //special factory constructor for smaller button with the same look
  factory BorderedTextButton.mini({
    required VoidCallback onTap,
    required String text,
  }) {
    return BorderedTextButton(onTap: onTap, text: text, mini: true);
  }

  @override
  State<BorderedTextButton> createState() => _BorderedTextButtonState();
}

class _BorderedTextButtonState extends State<BorderedTextButton>
    with SingleTickerProviderStateMixin {
  bool isHover = false;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //fi the mini is true then a lesser font size
    double? fontSize;
    if (widget.mini) {
      fontSize = 10;
    }
    return AnimatedBuilder(
      animation: controller,
      builder:
          (context, child) => CustomPaint(
            //the linear border is only visible in hvering state
            painter: isHover ? LinearBorder(animation: controller) : null,
            child: TextButton(
              onHover: (value) => isHovering(value),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.surface,
                ),
                shape: WidgetStatePropertyAll(
                  //if the dark is true then the border color will be grey otherwise it will be primary color
                  BeveledRectangleBorder(
                    side:
                        isHover
                            ? BorderSide(color: Colors.transparent)
                            : BorderSide(
                              color:
                                  widget.dark
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.primary,
                            ),
                  ),
                ),
              ),
              onPressed: widget.onTap,
              //if the dark is true then the text will be in grey with lesser weight otherwise white color whith more fontweight
              child: Text(
                widget.text,
                style:
                    widget.dark
                        ? Theme.of(context).textTheme.bodyMedium
                        : Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(fontSize: fontSize),
              ),
            ),
          ),
    );
  }

  isHovering(bool value) {
    setState(() {
      isHover = value;
    });
    if (isHover) {
      controller
        ..forward()
        ..repeat();
    } else {
      controller.stop();
    }
  }
}

//custom class for linear gradient border with aniamtion
class LinearBorder extends CustomPainter {
  AnimationController animation;
  LinearBorder({required this.animation}) : super(repaint: animation);
  @override
  void paint(Canvas canvas, Size size) {
    //rectangle for drawing the border
    Rect rect = Rect.fromPoints(Offset.zero, Offset(size.width, size.height));
    Gradient gradient = LinearGradient(
      colors: [
        AppColors.primary,
        AppColors.primary,
        Colors.transparent,
        Colors.transparent,
      ],
      //gradient rotation
      transform: GradientRotation(animation.value * (2 * pi)),
    );
    Paint paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..shader = gradient.createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
