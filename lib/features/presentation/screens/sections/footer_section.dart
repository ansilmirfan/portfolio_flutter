import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/url.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/data/services/url_launcher_service.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';
import 'package:portfolio/features/presentation/widgets/animated_icon.dart';
import 'package:portfolio/features/presentation/widgets/gap.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    //checking whether the screen size is lessthan 800
    final isMobile = ScreenUtils.isMobile(context);
    //width factor for difference screen sizes
    final wFactor = isMobile ? 0.9 : 0.44;
    final width = ScreenUtils.width(context).multiply(wFactor);
    return Column(
      children: [
        Divider(),
        Wrap(
          runSpacing: 10,
          children: [
            SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment:
                    isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Image.network(
                        "assets/images/am.png",
                        width: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        "Ansil Mirfan",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Text("Flutter Developer"),
                ],
              ),
            ),
            SizedBox(
              width: width,
              child: Row(
                spacing: 15,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    isMobile ? MainAxisAlignment.center : MainAxisAlignment.end,
                children: [
                  AnimationIcon(
                    icon: FontAwesomeIcons.solidEnvelope,
                    ontap: () => UrlLauncherService.launch(Url.email),
                    color: AppColors.google,
                  ),
                  AnimationIcon(
                    icon: FontAwesomeIcons.whatsapp,
                    ontap: () => UrlLauncherService.launch(Url.whatsapp),
                    color: AppColors.whatsApp,
                  ),
                  AnimationIcon(
                    icon: FontAwesomeIcons.linkedin,
                    ontap: () => UrlLauncherService.launch(Url.linkedin),
                    color: AppColors.linkedin,
                  ),
                  AnimationIcon(
                    icon: FontAwesomeIcons.github,
                    ontap: () => UrlLauncherService.launch(Url.gitHub),
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(gap: 50),
      ],
    );
  }
}
