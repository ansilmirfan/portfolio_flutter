import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/about_image_part.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/about_text_part.dart';
import 'package:portfolio/features/presentation/widgets/bordered_container.dart';
import 'package:portfolio/features/presentation/widgets/dot_container.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    //checking whether the screen size is lessthan 800
    final isMobile = ScreenUtils.isMobile(context);
    //width factor for difference screen sizes
    final wFactor = isMobile ? 0.9 : 0.44;
    final width = ScreenUtils.width(context).multiply(wFactor);
    return IntrinsicHeight(
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!isMobile)
            Align(
              alignment: Alignment(-1.03, 0),
              child: BorderedContainer(height: 160, width: 50),
            ),
          if (!isMobile)
            Align(
              alignment: Alignment.bottomRight,
              child: DotContainer(row: 4, column: 6),
            ),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              AboutTextPart(width: width),
              AboutImagePart(width: width),
            ],
          ),
        ],
      ),
    );
  }
}
