import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';
import 'package:portfolio/features/presentation/widgets/bordered_container.dart';

class SkillsContainer extends StatelessWidget {
  final String title;
  final String content;
  const SkillsContainer({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: BorderedContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
            ),
            //divider
            Container(color: AppColors.grey, height: 1, width: double.infinity),
            //contents
            Padding(padding: const EdgeInsets.all(8.0), child: Text(content)),
          ],
        ),
      ),
    );
  }
}
