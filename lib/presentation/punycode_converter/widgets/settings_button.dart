import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:punycode_converter/presentation/core/gestures/tappable.dart';
import 'package:punycode_converter/presentation/settings/settings_screen.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: () {
        CupertinoScaffold.showCupertinoModalBottomSheet(
          duration: const Duration(milliseconds: 300),
          animationCurve: Curves.linearToEaseOut,
          previousRouteAnimationCurve: Curves.linearToEaseOut,
          context: context,
          builder: constF(const SettingsScreen()),
        );
      },
      child: const SizedBox.square(
        dimension: 48.0,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_horiz_outlined),
          ),
        ),
      ),
    );
  }
}
