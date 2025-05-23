import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/section_keys.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/data/services/scroll_service.dart';
import 'package:portfolio/features/presentation/screens/sections/about_section.dart';
import 'package:portfolio/features/presentation/screens/sections/contacts_section.dart';
import 'package:portfolio/features/presentation/screens/sections/footer_section.dart';
import 'package:portfolio/features/presentation/screens/sections/home_section.dart';
import 'package:portfolio/features/presentation/screens/sections/projects_section.dart';
import 'package:portfolio/features/presentation/screens/sections/skills_section.dart';
import 'package:portfolio/features/presentation/widgets/custom_appbar.dart';
import 'package:portfolio/features/presentation/widgets/custom_drawer.dart';
import 'package:portfolio/features/presentation/widgets/floating_button.dart';
import 'package:portfolio/features/presentation/widgets/gap.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer will be only visible if the screen width is less than 800
      drawer: !ScreenUtils.isDesktop(context) ? CustomDrawer() : null,
      body: CustomScrollView(
        cacheExtent: 10,
        slivers: [
          CustomAppbar(),
          SliverList(
            delegate: SliverChildListDelegate([
              HomeSection(key: SectionKeys.sectionKeys[0]),
              Gap(gap: 30),
              AboutMeSection(key: SectionKeys.sectionKeys[1]),
              Gap(gap: 30),
              ProjectsSection(key: SectionKeys.sectionKeys[2]),
              Gap(gap: 30),
              SkillsSection(key: SectionKeys.sectionKeys[3]),
              Gap(gap: 30),
              ContactsSection(key: SectionKeys.sectionKeys[4]),
              Gap(gap: 30),
              FooterSection(),
            ]),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          FloatingButton(
            icon: Icons.keyboard_arrow_up_outlined,
            onTap: () => ScrollService.scrollToPosition(0),
          ),
          FloatingButton(
            icon: Icons.keyboard_arrow_down_outlined,
            onTap: () => ScrollService.scrollToPosition(4),
          ),
        ],
      ),
    );
  }
}
