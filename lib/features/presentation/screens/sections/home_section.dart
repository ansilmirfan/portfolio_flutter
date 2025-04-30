import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/home_intro_contents.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/profile_image_panel.dart';
import 'package:portfolio/features/presentation/widgets/bordered_text_button.dart';

import 'package:portfolio/features/presentation/widgets/group_icons.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    //checking whether the screen size is lessthan 800
    final isMobile = ScreenUtils.isMobile(context);
    //width factor for difference screen sizes
    final wFactor = isMobile ? 0.9 : 0.44;
    final width = ScreenUtils.width(context).multiply(wFactor);
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                HomeIntroContents(width: width, isNotMobile: !isMobile),
                ProfileImagePanel(width: width),
              ],
            ),
            //group icon will be only visible in bigger screen sizes
            if (!isMobile) _groupIcon(),
          ],
        ),
        BorderedTextButton(onTap: () {}, text: "  Download CV ↓"),
      ],
    );
  }

  Align _groupIcon() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GroupIcons.vertical(mainAxisSize: MainAxisSize.min),
    );
  }
}
