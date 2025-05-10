// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';
import 'package:portfolio/features/presentation/value_listenable/selected_nav.dart';
import 'package:portfolio/features/presentation/widgets/gap.dart';
import 'package:portfolio/features/presentation/widgets/text/hash_text.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //if the device is mobile or screen size is equals mobile size then it returns null
      title:
      //if the screen is mobile then the title is null otherwise the name will be shown
      //propotionate padding in the left side of the spacing will be always 5 percentage of the screen width
      Padding(
        padding: EdgeInsets.only(
          left: ScreenUtils.width(context).multiply(0.05),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Image.network(
              "assets/images/am.png",
              width: 25,
              color: AppColors.primary,
            ),
            Text('Ansil Mirfan', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
      //if the device is not desktop then it returns null
      actions: !ScreenUtils.isDesktop(context) ? null : [AppBarItems()],
    );
  }
}

// this widget returns a row that contains a list of text buttons for the navigation bar
class AppBarItems extends StatelessWidget {
  const AppBarItems({super.key});

  // list of items for navigation
  final List<String> navItems = const [
    'home',
    'about-me',
    'projects',
    'skills',
    'contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      // for proportionate spacing: 2% of screen width
      spacing: ScreenUtils.width(context).multiply(0.02),
      children: [
        // create buttons for each nav item
        ...List.generate(navItems.length, (index) {
          return _NavButton(label: navItems[index], index: index);
        }),
        // for proportionate spacing: 5% of screen width at the end
        Gap.width(gap: ScreenUtils.width(context).multiply(0.05)),
      ],
    );
  }
}

// individual navigation button widget with its own animation controller
class _NavButton extends StatefulWidget {
  final String label;
  final int index;

  const _NavButton({required this.label, required this.index});

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _wasSelected = false;
  bool _isHovered = false;

  bool get isSelected => SelectedNav.selectedNav.value == widget.index;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _wasSelected = isSelected;
    if (_wasSelected) _controller.value = 1.0;

    SelectedNav.selectedNav.addListener(_handleSelectionChange);
  }

  void _handleSelectionChange() {
    final currentlySelected = isSelected;

    // Animate in if selected or hovered
    if (currentlySelected || _isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    _wasSelected = currentlySelected;
  }

  void _handleHover(bool hovering) {
    _isHovered = hovering;

    // Only animate if it's not selected (selected already animates on its own)
    if (_isHovered || isSelected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    SelectedNav.selectedNav.removeListener(_handleSelectionChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return TextButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              shape: WidgetStatePropertyAll(
                LinearBorder(
                  side: BorderSide(
                    width: _animation.value > 0 ? 3 : 0,
                    color: AppColors.primary,
                  ),
                  bottom: LinearBorderEdge(
                    size: 0.8 * _animation.value,
                    alignment: 0.1,
                  ),
                ),
              ),
            ),
            onPressed: () {
              if (!isSelected) {
                SelectedNav.update(widget.index);
              }
            },
            child: HashText(text: widget.label),
          );
        },
      ),
    );
  }
}
