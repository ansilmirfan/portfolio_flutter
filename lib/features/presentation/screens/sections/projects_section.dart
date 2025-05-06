import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/data/data.dart';
import 'package:portfolio/features/presentation/screens/all_projects.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/lined_title.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/project_card.dart';

import 'package:portfolio/features/presentation/widgets/bordered_text_button.dart';
import 'package:portfolio/features/presentation/widgets/gap.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    //checking whether the screen size is lessthan 800
    final isMobile = ScreenUtils.isMobile(context);
    //width factor for difference screen sizes
    final wFactor = isMobile ? 0.9 : 0.88;
    final width = ScreenUtils.width(context).multiply(wFactor);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 420,
          width: width,

          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              _header(context),
              Gap(gap: 20),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10),

                  scrollDirection: Axis.horizontal,
                  itemCount: Data.mainProjects.length,
                  itemBuilder:
                      (context, index) =>
                          ProjectCard(project: Data.mainProjects[index]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _header(BuildContext context) {
    return Row(
      children: [
        Expanded(child: LinedTitle(title: 'projects')),
        Gap.width(gap: 20),
        BorderedTextButton.mini(
          onTap: () => context.pushTransperent(AllProjects()),
          text: 'view all-->',
        ),
      ],
    );
  }
}
