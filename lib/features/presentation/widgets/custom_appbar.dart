import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
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
          ScreenUtils.isMobile(context)
              ? null
              //propotionate padding in the left side of the spacing will be always 5 percentage of the screen width
              : Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtils.width(context).multiply(0.05),
                ),
                child: Text(
                  'Ansil Mirfan',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
      //if the device is mobile or screen size is equals mobile size then it returns null
      actions: ScreenUtils.isMobile(context) ? null : [AppBarItems()],
    );
  }
}

//this widget returns rpw that contains list text buttons for the navigation bar
class AppBarItems extends StatefulWidget {
  const AppBarItems({super.key});

  @override
  State<AppBarItems> createState() => _AppBarItemsState();
}

List<String> navItems = ['home', 'about-me', 'projects', 'skills', 'contact'];
int selected = 0;

class _AppBarItemsState extends State<AppBarItems> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 50,
      children: [
        ...List.generate(
          navItems.length,
          (index) => TextButton(
            onPressed: () {
              //updating the selected index
              setState(() {
                selected = index;
              });
            },
            //selected index will have a bolded white text style
            child: HashText(text: navItems[index], selected: index == selected),
          ),
        ),
        // for propotionate spacing the space will be always five percentage of the screen width
        Gap.width(gap: ScreenUtils.width(context).multiply(0.05)),
      ],
    );
  }
}
