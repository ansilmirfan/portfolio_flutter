import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/lined_title.dart';
import 'package:portfolio/features/presentation/widgets/bordered_text_button.dart';

class AboutTextPart extends StatefulWidget {
  final double width;

  const AboutTextPart({super.key, required this.width});

  @override
  State<AboutTextPart> createState() => _AboutTextPartState();
}

bool expanded = false;
final Duration duration = Duration(milliseconds: 400);

class _AboutTextPartState extends State<AboutTextPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          const LinedTitle(title: 'about-me').slideToRight(delay: 450),

          _aboutMeText(),

          BorderedTextButton(
            onTap: update,
            text: expanded ? 'Read less ←' : 'Read more →',
          ).slideToRight(delay: 550),
        ],
      ),
    );
  }

  void update() {
    setState(() {
      expanded = !expanded;
    });
  }

  AnimatedSize _aboutMeText() {
    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: duration,
      reverseDuration: duration,
      curve: Curves.linearToEaseOut,
      child: Text(
        "Hello, I’m Ansil Mirfan\n\n"
        "I’m a self-taught Flutter developer with a strong passion for building beautiful, responsive, and high-performance mobile applications. "
        "Based in Wayanad, I focus on transforming ideas into seamless cross-platform experiences using Flutter and Dart.\n\n"
        "Over the past year, I’ve been continuously learning and creating apps that prioritize clean design, intuitive user experience, and maintainable code. "
        "I enjoy exploring new technologies in the Flutter ecosystem and constantly strive to improve my skills with each project I work on.\n\n"
        "In addition to mobile development, I'm also interested in UI/UX design and enjoy crafting interfaces that feel both functional and elegant. "
        "My goal is to build meaningful digital products that solve real-world problems and provide lasting value to users.",

        maxLines: expanded ? 100 : 10,
        overflow: TextOverflow.fade,
      ).slideToRight(delay: 500),
    );
  }
}
