import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extension/extensions.dart';
import 'package:portfolio/features/data/models/project.dart';
import 'package:portfolio/features/data/services/url_launcher_service.dart';
import 'package:portfolio/features/presentation/screens/project_view.dart';

import 'package:portfolio/features/presentation/themes/color/app_colors.dart';
import 'package:portfolio/features/presentation/widgets/bordered_text_button.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Decoration> decorationAnim;

  bool hover = false;
  Offset rotation = Offset.zero;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    //decoration animation for hover effect animation
    decorationAnim = DecorationTween(
      begin: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        color: AppColors.bgColor,
      ),
      end: BoxDecoration(
        color: AppColors.bgColor,
        border: Border.all(color: AppColors.primary),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(120),
            spreadRadius: 6,
            blurRadius: 10,
          ),
        ],
      ),
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _onHover(true),
      onHover: (event) => _updateRotation(event),
      onExit: (event) => _onHover(false),

      child: AnimatedBuilder(
        animation: decorationAnim,
        builder: (context, child) {
          return TweenAnimationBuilder<Offset>(
            tween: Tween<Offset>(
              begin: rotation,
              end: hover ? rotation : Offset.zero,
            ),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            builder: (context, value, _) {
              return Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(-value.dx)
                      ..rotateY(value.dy),
                child: Container(
                  width: 250,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: decorationAnim.value,
                  child: Material(
                    child: InkWell(
                      onTap:
                          () => context.pushTransperent(
                            ProjectView(project: widget.project),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //logo image only if it is not null
                          if (widget.project.logoImage != null)
                            Expanded(
                              child: SizedBox(
                                child: Image.network(
                                  widget.project.logoImage!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          Divider(hover: hover),
                          // languages used
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(widget.project.languages),
                          ),
                          Divider(hover: hover),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //title
                                  Text(
                                    widget.project.title,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  //slogan
                                  Text(widget.project.slogan),
                                  const Spacer(),
                                  Row(
                                    spacing: 10,
                                    children: [
                                      //the button is only visible when thelive link url is not null
                                      if (widget.project.liveLink != null)
                                        _liveLinkButton(),

                                      gitHubButton(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  BorderedTextButton gitHubButton() {
    return BorderedTextButton.mini(
      onTap: () {
        UrlLauncherService.launch(widget.project.gitHubLink);
      },
      text: 'Github <~>',
    );
  }

  BorderedTextButton _liveLinkButton() {
    return BorderedTextButton.mini(
      onTap: () {
        UrlLauncherService.launch(widget.project.liveLink!);
      },
      text: 'Live <~>',
    );
  }

  //function for updating hovering or not
  void _onHover(bool hovering) {
    hover = hovering;
    if (hovering) {
      controller.forward();
    } else {
      controller.reverse();
    }
    setState(() {});
  }

  void _updateRotation(PointerEvent event) {
    final box = context.findRenderObject() as RenderBox;
    final size = box.size;

    //local possition of the widget
    final localPos = event.localPosition;

    final dx = (localPos.dx - size.width / 2) / (size.width / 2);
    final dy = (localPos.dy - size.height / 2) / (size.height / 2);

    // Limiting the value of tilt angle(0.3 is 54 degree)
    const maxTilt = 0.3;

    setState(() {
      rotation = Offset(dy * maxTilt, dx * maxTilt);
    });
  }
}

class Divider extends StatelessWidget {
  final bool hover;
  const Divider({super.key, required this.hover});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color:
          hover
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
    );
  }
}
