import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/presentation/widgets/custom_appbar.dart';
import 'package:portfolio/features/presentation/widgets/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer will be only visible if the screen width is less than 800
      drawer: ScreenUtils.isMobile(context) ? CustomDrawer() : null,
      body: CustomScrollView(slivers: [CustomAppbar()]),
    );
  }
}
