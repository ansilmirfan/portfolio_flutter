// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/features/data/services/scroll_service.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';
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

  Widget _buildName(BuildContext context) => Row(
    spacing: 10,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.network(
        "assets/images/am.png",
        height: 25,
        color: AppColors.primary,
      ),
      Text('Ansil Mirfan', style: Theme.of(context).textTheme.bodyLarge),
    ],
  );

  Expanded _buildListView() {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: SelectedNav.selectedNav,
        builder: (context, selectedIndex, child) {
          return ListView.builder(
            itemCount: navItems.length,
            itemBuilder: (context, index) {
              return _NavListTile(
                label: navItems[index],
                index: index,
                isSelected: index == selectedIndex,
              );
            },
          );
        },
      ),
    );
  }
}

// individual navigation button widget with its own animation controller
class _NavListTile extends StatefulWidget {
  final String label;
  final int index;
  final bool isSelected;

  const _NavListTile({
    required this.label,
    required this.index,
    required this.isSelected,
  });

  @override
  State<_NavListTile> createState() => _NavListTileState();
}

class _NavListTileState extends State<_NavListTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.isSelected) _controller.value = 1.0;
  }

  void _handleHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
    });

    if (_isHovered || widget.isSelected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return ListTile(
            onTap: () {
              if (!widget.isSelected) {
                SelectedNav.update(widget.index);
                context.pop();
                ScrollService.scrollToPosition(widget.index);
              }
            },
            shape: LinearBorder(
              side: BorderSide(
                color:
                    widget.isSelected || _isHovered
                        ? AppColors.primary
                        : Colors.transparent,
                width: 3.0,
              ),
              bottom: LinearBorderEdge(size: _animation.value * 0.9),
            ),
            title: HashText(text: widget.label, selected: widget.isSelected),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
