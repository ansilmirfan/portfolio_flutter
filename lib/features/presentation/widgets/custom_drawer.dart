// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/features/presentation/value_listenable/selected_nav.dart';
import 'package:portfolio/features/presentation/widgets/gap.dart';
import 'package:portfolio/features/presentation/widgets/text/hash_text.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  List<String> navItems = ['home', 'about-me', 'projects', 'skills', 'contact'];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Gap(gap: 50),
          _buildName(context),
          Gap(gap: 20),

          _buildListView(),
          Spacer(),
          _groupIcons(),
          Gap(gap: 20),
        ],
      ),
    );
  }

  Row _groupIcons() {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.github)),
        IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.linkedin)),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.solidEnvelope),
        ),
      ],
    );
  }

  Text _buildName(BuildContext context) =>
      Text('Ansil Mirfan', style: Theme.of(context).textTheme.bodyLarge);

  Expanded _buildListView() {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: SelectedNav.selectedNav,
        builder:
            (context, value, child) => ListView.builder(
              itemCount: navItems.length,
              itemBuilder:
                  (context, index) => ListTile(
                    onTap: () {
                      //updating selected value to the value notifier
                      SelectedNav.update(index);
                      context.pop();
                    },

                    title: HashText(
                      text: navItems[index],
                      //selected itemitem will have a bolded text style
                      selected: index == value,
                    ),
                  ),
            ),
      ),
    );
  }
}
