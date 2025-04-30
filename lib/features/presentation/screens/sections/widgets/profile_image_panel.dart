import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
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
            maxHeight: ScreenUtils.height(context).multiply(0.6),
          ),
          width: width,

          padding: EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //logo in the background
              Align(
                alignment: Alignment(-0.7, -0.7),
                child: Image.network('assets/images/logo.png', width: 250),
              ),
              //user image
              Image.network('assets/images/hoodie1.png'),
              Align(
                alignment: Alignment(0.6, 0.8),
                child: DotContainer(row: 6, column: 6),
              ),
            ],
          ),
        ),
        _sloganText(),
      ],
    );
  }

  Padding _sloganText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BorderedContainer(
        padding: 5,
        child: Text('Open to Opportunities — Let’s Build Together.'),
      ),
    );
  }
}
