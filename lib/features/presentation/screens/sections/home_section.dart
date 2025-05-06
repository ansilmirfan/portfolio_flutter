import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/data/services/url_launcher_service.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/home_intro_contents.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/profile_image_panel.dart';
import 'package:portfolio/features/presentation/widgets/bordered_container.dart';
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
        Row(
          children: [
            Spacer(),
            //cv download button
            BorderedTextButton(
              onTap:
                  () => UrlLauncherService.launch(
                    'https://drive.google.com/uc?export=view&id=1K002nHDUXPArRGitodMeY459utlu1v9R',
                  ),
              text: "  Download Resume ↓",
            ),
            Spacer(),
            Transform.translate(
              offset: Offset(20.5, 1),
              child: BorderedContainer(height: 50, width: 50),
            ),
          ],
        ),
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
