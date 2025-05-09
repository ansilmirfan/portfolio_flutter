import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/lined_title.dart';
import 'package:portfolio/features/presentation/screens/sections/widgets/skills_container.dart';
import 'package:portfolio/features/presentation/widgets/bordered_container.dart';
import 'package:portfolio/features/presentation/widgets/dot_container.dart';

class ResposiveSkillsView extends StatelessWidget {
  final bool isMobile;
  ResposiveSkillsView({super.key, required this.isMobile});
  final skillsList = [
    const SkillsContainer(title: "Languages", content: "Dart"),
    const SkillsContainer(
      title: "Database",
      content: "SqfLite   Hive  MongoDb",
    ),
    const SkillsContainer(title: "Frontend", content: "Flutter   HTML   CSS"),
    const SkillsContainer(
      title: "State Management",
      content: "BLOC   Getx   Provider",
    ),
    const SkillsContainer(
      title: "Tools",
      content: "Git   VScode   Figma  Android Studio",
    ),
    const SkillsContainer(
      title: "Others",
      content: "REST API   Google Maps   Firebase",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return MobileView(skillsList: skillsList);
    } else {
      return DeskTopView(skillsList: skillsList);
    }
  }
}

class MobileView extends StatelessWidget {
  final List<SkillsContainer> skillsList;
  const MobileView({super.key, required this.skillsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SizedBox(width: double.infinity, child: LinedTitle(title: 'skills')),
        LayoutBuilder(
          builder:
              (context, constraints) => Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  5,
                  (index) => SizedBox(
                    width: constraints.maxWidth.multiply(0.45),
                    child: skillsList[index],
                  ),
                ),
              ),
        ),
      ],
    );
  }
}

class DeskTopView extends StatelessWidget {
  final List<SkillsContainer> skillsList;
  const DeskTopView({super.key, required this.skillsList});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [Expanded(flex: 2, child: _buildLeftView()), _buildRightView()],
    );
  }

  Expanded _buildRightView() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Column(children: [skillsList[0]])),
            Expanded(child: Column(children: [skillsList[1], skillsList[2]])),
            Expanded(child: Column(children: [skillsList[3], skillsList[4]])),
          ],
        ),
      ),
    );
  }

  Column _buildLeftView() {
    return Column(
      spacing: 20,
      children: [
        const LinedTitle(title: "skills"),
        SizedBox(
          height: 250,
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Positioned(
                  top: 10,
                  left: 0,
                  child: DotContainer(row: 5, column: 5),
                ),
                const Positioned(
                  top: 0,
                  right: 10,
                  child: BorderedContainer(height: 50, width: 50),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  child: Image.asset('assets/images/logo.png', height: 80),
                ),
                const Positioned(
                  right: 0,
                  bottom: 10,
                  child: DotContainer(row: 5, column: 5),
                ),
                const Center(child: BorderedContainer(height: 50, width: 50)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
