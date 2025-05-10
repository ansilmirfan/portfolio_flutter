import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/animated_icons.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/contact.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/lined_title.dart';
import 'package:portfolio/features/presentation/widgets/bordered_container.dart';

class ContactsSection extends StatelessWidget {
  const ContactsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ScreenUtils.isMobile(context);
    final wFactor = isMobile ? 0.9 : 0.44;
    final width = ScreenUtils.width(context).multiply(wFactor);

    return Stack(
      alignment: Alignment.center,
      children: [
        Wrap(
          children: [
            SizedBox(width: width, child: const ContactText()),
            SizedBox(width: width, child: const ContactDetails()),
          ],
        ),
      ],
    );
  }
}

class ContactText extends StatelessWidget {
  const ContactText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        spacing: 20,
        children: const [
          SizedBox(width: double.infinity, child: LinedTitle(title: "contact")),
          Text(
            "Open to freelance and on-site opportunities. Feel free to reach out with any inquiries.",
          ),
        ],
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BorderedContainer(
            padding: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Text(
                  "Message me here",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Contact(icon: AnimIcon.email, text: "ansilmirfan123@gmail.com"),
                Contact(icon: AnimIcon.mobile, text: "+917356093690"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
