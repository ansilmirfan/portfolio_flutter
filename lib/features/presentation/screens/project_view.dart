// ignore_for_file: use_build_context_synchronously

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/data/models/project.dart';
import 'package:portfolio/features/data/services/url_launcher_service.dart';
import 'package:portfolio/features/presentation/widgets/bordered_text_button.dart';
import 'package:portfolio/features/presentation/widgets/slide_widget.dart';
import 'package:portfolio/features/presentation/widgets/text/hash_text.dart';

class ProjectView extends StatefulWidget {
  final Project project;
  const ProjectView({super.key, required this.project});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  // All SlideWidgets need a key to control reverse animation
  final List<GlobalKey<SlideWidgetState>> _slideKeys = List.generate(
    8,
    (_) => GlobalKey<SlideWidgetState>(),
  );

  @override
  Widget build(BuildContext context) {
    final isMobile = ScreenUtils.isMobile(context);
    final wFactor = isMobile ? 0.9 : 0.60;
    final width = ScreenUtils.width(context).multiply(wFactor);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        // Reverse animations one by one (in reverse order)

        _updateAnimation(context);
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          // onTap: () => context.pop(),
          child: Stack(
            children: [
              Material(
                color: Colors.transparent,
                child: SafeArea(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _buildAnimatedContainer(width),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateAnimation(BuildContext context) {
    for (int i = 0; i <= _slideKeys.length; i++) {
      _slideKeys[i].currentState?.reverse().then((value) {
        if (i == 7) {
          if (mounted) context.pop();
        }
      });
    }
  }

  Widget _buildAnimatedContainer(double width) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          if (widget.project.image != null) _buildImage(),
          _buildTitle(),
          _buildDivider(2, 300),
          _buildLanguages(),
          _buildDescription(),
          _buildDivider(5, 450),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Expanded(
      child: SlideWidget(
        key: _slideKeys[0],
        slide: Slide.toLeft,
        delay: 200,
        child: Image.network(widget.project.image!, fit: BoxFit.fitWidth),
      ),
    );
  }

  Widget _buildTitle() {
    return SlideWidget(
      key: _slideKeys[1],
      slide: Slide.toLeft,
      delay: 250,
      child: HashText(text: widget.project.title),
    );
  }

  Widget _buildDivider(int index, int delay) {
    return SlideWidget(
      key: _slideKeys[index],
      slide: Slide.toLeft,
      delay: delay,
      child: const Divider(),
    );
  }

  Widget _buildLanguages() {
    return SlideWidget(
      key: _slideKeys[3],
      slide: Slide.toLeft,
      delay: 350,
      child: Text(
        widget.project.languages,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildDescription() {
    return SlideWidget(
      key: _slideKeys[4],
      slide: Slide.toLeft,
      delay: 400,
      child: Text(widget.project.description),
    );
  }

  Widget _buildButtons() {
    return Row(
      spacing: 20,
      children: [
        if (widget.project.liveLink != null)
          SlideWidget(
            key: _slideKeys[6],
            slide: Slide.toLeft,
            delay: 500,
            child: BorderedTextButton(
              onTap: () => UrlLauncherService.launch(widget.project.liveLink!),
              text: "Live <~>",
            ),
          ),
        SlideWidget(
          key: _slideKeys[7],
          slide: Slide.toLeft,
          delay: 550,
          child: BorderedTextButton(
            onTap: () => UrlLauncherService.launch(widget.project.gitHubLink),
            text: "Github <~>",
          ),
        ),
      ],
    );
  }
}
