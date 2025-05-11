import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/animated_icons.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
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
      spacing: 20,
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
                  ).slideToRight(delay: 200),
                  Text("Flutter Developer").slideToRight(delay: 250),
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
                  AnimIcon.email.slideToLeft(delay: 300),
                  AnimIcon.whatsApp.slideToLeft(delay: 350),
                  AnimIcon.linkedin.slideToLeft(delay: 400),
                  AnimIcon.gitHub.slideToLeft(delay: 450),
                ],
              ),
            ),
          ],
        ),
        Gap(gap: 40),
      ],
    );
  }
}
