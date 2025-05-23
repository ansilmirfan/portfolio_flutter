import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/features/data/services/scroll_service.dart';
import 'package:portfolio/features/presentation/widgets/bordered_text_button.dart';
import 'package:portfolio/features/presentation/widgets/gap.dart';
import 'package:portfolio/features/presentation/widgets/text/typing_text.dart';

class HomeIntroContents extends StatelessWidget {
  final double width;
  final bool isNotMobile;
  const HomeIntroContents({
    super.key,
    required this.width,
    required this.isNotMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width,

      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          TypingText(text: 'Ansil Mirfan').slideToRight(),
          RichText(
            //name
            text: TextSpan(
              text: 'is a ',
              style: Theme.of(context).textTheme.headlineLarge,
              children: [
                //possition
                TextSpan(
                  text: 'Flutter Developer',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ).slideToRight(),

          Gap(gap: 40),
          //slogan text
          Text(
            'Transforming Ideas into Apps with Flutter.',
          ).slideToRight(delay: 250),
          Gap(gap: 20),
          //only visible if is a smaller size device
          if (isNotMobile)
            BorderedTextButton(
              onTap: () {
                ScrollService.scrollToPosition(4);
              },
              text: 'Contact me!!',
            ).slideToRight(delay: 300),
        ],
      ),
    );
  }
}
