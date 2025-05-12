import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static launch(String url) async {
    final Uri link = Uri.parse(url);
    await launchUrl(link, mode: LaunchMode.platformDefault);
  }
}
