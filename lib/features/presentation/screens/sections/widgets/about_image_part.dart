import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/features/presentation/widgets/dot_container.dart';
import 'package:portfolio/features/presentation/widgets/horizontal_line.dart';

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
            Column(
              children: [
                Image.network(
                  'assets/images/hoodie2.png',
                  width: width.multiply(0.5),
                ),
                SizedBox(width: width.multiply(0.5), child: HorizontalLine()),
              ],
            ),
            AnimatedPositioned(
              duration: duration,
              left: width.multiply(0.5),
              top: width.multiply(0.4),

              child: DotContainer(row: 6, column: 6),
            ),

            AnimatedPositioned(
              duration: duration,
              top: 0,
              left: width.multiply(0.3),
              child: DotContainer(row: 7, column: 3),
            ),
          ],
        ),
      ),
    );
  }
}
