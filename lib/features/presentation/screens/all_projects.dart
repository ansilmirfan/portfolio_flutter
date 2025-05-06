import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/data/data.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/lined_title.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/project_card.dart';
import 'package:portfolio/features/presentation/widgets/bordered_container.dart';
import 'package:portfolio/features/presentation/widgets/dot_container.dart';
import 'package:portfolio/features/presentation/widgets/gap.dart';

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
              if (!isMobile) _borderedContainers(),
              Center(
                child: SizedBox(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(gap: 20),
                      _title('Main Projects'),
                      isMobile
                          ? _horizontalProjectList(
                            Data.mainProjects,
                            height: 300,
                          )
                          : _wrapProjectList(Data.mainProjects, height: 300),
                      _title('Small Projects'),
                      isMobile
                          ? _horizontalProjectList(
                            Data.smallProjects,
                            height: 175,
                          )
                          : _wrapProjectList(Data.smallProjects, height: 175),
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

  Positioned _borderedContainers() {
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

  SizedBox _title(String title) {
    return SizedBox(width: double.infinity, child: LinedTitle(title: title));
  }

  Widget _horizontalProjectList(List projectList, {required double height}) {
    return SizedBox(
      height: height + 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: projectList.length,
        itemBuilder:
            (context, index) => SizedBox(
              width: 250,
              child: ProjectCard(project: projectList[index]),
            ),
      ),
    );
  }

  Widget _wrapProjectList(List projectList, {required double height}) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: List.generate(
        projectList.length,
        (index) => SizedBox(
          height: height,
          width: 250,
          child: ProjectCard(project: projectList[index]),
        ),
      ),
    );
  }
}
