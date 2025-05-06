import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/data/data.dart';
import 'package:portfolio/features/data/models/project.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/lined_title.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/project_card.dart';
import 'package:portfolio/features/presentation/widgets/bordered_container.dart';
import 'package:portfolio/features/presentation/widgets/dot_container.dart';
import 'package:portfolio/features/presentation/widgets/gap.dart';
import 'package:portfolio/features/presentation/widgets/slide_widget.dart';

class AllProjects extends StatelessWidget {
  const AllProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ScreenUtils.isMobile(context);
    final wFactor = isMobile ? 0.9 : 0.88;
    final width = ScreenUtils.width(context).multiply(wFactor);

    return Scaffold(
      appBar: AppBar(),
      body: IntrinsicHeight(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              if (!isMobile) _dots(),
              if (!isMobile) _borderedContainer(),
              Center(
                child: SizedBox(
                  width: width,
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(gap: 20),
                      _title('Main Projects'),
                      ResponsiveProjectList(
                        height: 300,
                        projects: Data.mainProjects,

                        isMobile: isMobile,
                      ),
                      _title('Small Projects'),
                      ResponsiveProjectList(
                        height: 175,
                        projects: Data.smallProjects,

                        isMobile: isMobile,
                      ),
                      Gap(gap: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _borderedContainer() {
    return Positioned(
      left: -10,
      top: 180,
      child: BorderedContainer(height: 140, width: 50),
    );
  }

  Positioned _dots() {
    return Positioned(
      right: 0,
      top: 250,
      child: DotContainer(row: 3, column: 15),
    );
  }

  Widget _title(String title) {
    return SlideWidget(
      slide: Slide.toLeft,
      delay: 200,
      child: SizedBox(width: double.infinity, child: LinedTitle(title: title)),
    );
  }
}

class ResponsiveProjectList extends StatelessWidget {
  final List<Project> projects;
  final double height;
  final bool isMobile;

  const ResponsiveProjectList({
    super.key,
    required this.projects,
    required this.height,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return SizedBox(
        height: height + 20,
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: projects.length,
          itemBuilder: (context, index) => _animatedProject(index),
        ),
      );
    } else {
      return Wrap(
        spacing: 15,
        runSpacing: 15,
        children: List.generate(
          projects.length,
          (index) => SizedBox(
            height: height,
            width: 250,
            child: _animatedProject(index),
          ),
        ),
      );
    }
  }

  Widget _animatedProject(int index) {
    return SlideWidget(
      slide: Slide.toLeft,
      delay: 200 + ((index + 1) * 200),
      child: ProjectCard(project: projects[index]),
    );
  }
}
