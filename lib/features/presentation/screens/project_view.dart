import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/core/utils/screen_utils.dart';
import 'package:portfolio/features/data/models/project.dart';
import 'package:portfolio/features/data/services/url_launcher_service.dart';
import 'package:portfolio/features/presentation/widgets/bordered_text_button.dart';
import 'package:portfolio/features/presentation/widgets/text/hash_text.dart';

class ProjectView extends StatefulWidget {
  final Project project;
  const ProjectView({super.key, required this.project});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

Offset position = Offset.zero;

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {
    //checking whether the screen size is lessthan 800
    final isMobile = ScreenUtils.isMobile(context);
    //width factor for difference screen sizes
    final wFactor = isMobile ? 0.9 : 0.60;
    final width = ScreenUtils.width(context).multiply(wFactor);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => context.pop(),
        child: MouseRegion(
          onHover: (event) => _updatePossition(event),
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
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: width,

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (widget.project.image != null)
                                Expanded(
                                  child: Image.network(
                                    widget.project.image!,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              if (widget.project.image != null) Divider(),
                              HashText(text: widget.project.title),
                              Divider(),

                              Text(
                                widget.project.languages,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),

                              Text(widget.project.description),
                              Divider(),
                              _buttons(),
                            ],
                          ),
                        ),
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

  Row _buttons() {
    return Row(
      spacing: 20,
      children: [
        if (widget.project.liveLink != null)
          BorderedTextButton(
            onTap: () => UrlLauncherService.launch(widget.project.liveLink!),
            text: "Live <~>",
          ),
        BorderedTextButton(
          onTap: () => UrlLauncherService.launch(widget.project.gitHubLink),
          text: "Github <~>",
        ),
      ],
    );
  }

  _updatePossition(PointerHoverEvent event) {
    setState(() {
      position = event.position;
    });
  }
}
