import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/url.dart';
import 'package:portfolio/features/data/services/url_launcher_service.dart';
import 'package:portfolio/features/presentation/themes/color/app_colors.dart';
import 'package:portfolio/features/presentation/widgets/animated_icon.dart';

class AnimIcon {
  static Widget gitHub = AnimationIcon(
    icon: FontAwesomeIcons.github,
    ontap: () => UrlLauncherService.launch(Url.gitHub),
    color: AppColors.grey,
  );
  static Widget linkedin = AnimationIcon(
    icon: FontAwesomeIcons.linkedin,
    ontap: () => UrlLauncherService.launch(Url.linkedin),
    color: AppColors.linkedin,
  );
  static Widget email = AnimationIcon(
    icon: FontAwesomeIcons.solidEnvelope,
    ontap: () => UrlLauncherService.launch(Url.email),
    color: AppColors.google,
  );
  static Widget whatsApp = AnimationIcon(
    icon: FontAwesomeIcons.whatsapp,
    ontap: () => UrlLauncherService.launch(Url.whatsapp),
    color: AppColors.whatsApp,
  );
  static Widget mobile = AnimationIcon(
    icon: FontAwesomeIcons.mobile,
    ontap: () => UrlLauncherService.launch(Url.mobile),
    color: AppColors.primary,
  );
}
