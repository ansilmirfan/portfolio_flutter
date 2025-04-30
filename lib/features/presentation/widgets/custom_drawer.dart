// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/features/presentation/value_listenable/selected_nav.dart';
import 'package:portfolio/features/presentation/widgets/gap.dart';
import 'package:portfolio/features/presentation/widgets/group_icons.dart';
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
          GroupIcons.horizontal(),
          Gap(gap: 20),
        ],
      ),
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
