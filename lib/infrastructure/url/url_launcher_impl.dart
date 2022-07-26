import 'dart:io';

import 'package:punycode_converter/domain/url/i_url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncherImpl implements IUrlLauncher {
  @override
  Future<bool> launchUrl(String url) async {
    final canLaunch = await canLaunchUrlString(url);
    if (!canLaunch) {
      return false;
    }

    return launchUrlString(
      url,
      mode: _getLaunchMode(),
    );
  }

  LaunchMode _getLaunchMode() {
    if (Platform.isIOS || Platform.isMacOS) {
      return LaunchMode.platformDefault;
    } else {
      return LaunchMode.externalApplication;
    }
  }
}
