import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:punycode_converter/presentation/about/about_page.dart';
import 'package:punycode_converter/presentation/core/widgets/app_icon_button.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: const Icon(Boxicons.bx_dots_horizontal_rounded),
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
