import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/resposive_skills_view.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ScreenUtils.isMobile(context);
    final wFactor = isMobile ? 0.9 : 0.88;
    final width = ScreenUtils.width(context).multiply(wFactor);

    return Center(
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ResposiveSkillsView(isMobile: isMobile),
        ),
      ),
    );
  }
}
