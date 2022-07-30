import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:punycode_converter/presentation/core/gestures/tappable.dart';
import 'package:punycode_converter/presentation/settings/settings_screen.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: constF(const SettingsScreen()),
          ),
        );
      },
      child: const SizedBox.square(
        dimension: 48.0,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.settings),
          ),
        ),
      ),
    );
  }
}
