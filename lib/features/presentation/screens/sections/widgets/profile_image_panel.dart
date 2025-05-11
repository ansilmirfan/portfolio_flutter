import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';
import 'package:portfolio/features/presentation/widgets/bordered_container.dart';
import 'package:portfolio/features/presentation/widgets/dot_container.dart';

class ProfileImagePanel extends StatelessWidget {
  final double width;
  const ProfileImagePanel({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: ScreenUtils.height(context).multiply(0.5),
          ),
          width: width,

          padding: EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //logo in the background
              Align(
                alignment: Alignment(-1.0, -1.0),
                child: Image.network('assets/images/logo.png', width: 200),
              ).slideToLeft(delay: 250),
              //user image
              Image.network(
                'assets/images/am.png',
                color: AppColors.primary,
                width: 250,
              ).slideToLeft(delay: 300),
              Positioned(
                bottom: 0,
                left: width.multiply(0.75),
                child: DotContainer(row: 6, column: 6).slideToLeft(delay: 350),
              ),
            ],
          ),
        ),
        _sloganText(),
      ],
    );
  }

  Widget _sloganText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BorderedContainer(
        padding: 5,
        child: Text('Open to Opportunities — Let’s Build Together.'),
      ).slideToLeft(delay: 350),
    );
  }
}
