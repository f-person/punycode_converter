import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:punycode_converter/presentation/about/about_page.dart';
import 'package:punycode_converter/presentation/core/widgets/app_icon_button.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: const Icon(FontAwesomeIcons.ellipsis),
      onTap: () {
        CupertinoScaffold.showCupertinoModalBottomSheet(
          duration: const Duration(milliseconds: 300),
          animationCurve: Curves.linearToEaseOut,
          previousRouteAnimationCurve: Curves.linearToEaseOut,
          context: context,
          builder: constF(const AboutPage()),
        );
      },
    );
  }
}
