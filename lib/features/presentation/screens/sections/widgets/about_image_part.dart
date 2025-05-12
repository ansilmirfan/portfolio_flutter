import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';
import 'package:portfolio/features/presentation/widgets/dot_container.dart';

class AboutImagePart extends StatelessWidget {
  final double width;
  AboutImagePart({super.key, required this.width});
  final Duration duration = Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,

      child: Padding(
        padding: EdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/am.png',
              color: AppColors.primary,
              width: width.multiply(0.5),
            ).slideToLeft(delay: 600),
            AnimatedPositioned(
              duration: duration,
              left: width.multiply(0.5),
              top: width.multiply(0.4),

              child: DotContainer(row: 6, column: 6).slideToLeft(delay: 550),
            ),

            AnimatedPositioned(
              duration: duration,
              top: 0,
              left: width.multiply(0.3),
              child: DotContainer(row: 7, column: 3).slideToLeft(delay: 700),
            ),
          ],
        ),
      ),
    );
  }
}
