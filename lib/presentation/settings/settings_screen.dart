import 'package:flutter/material.dart';
import 'package:punycode_converter/gen/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.settingsScreenTitle,
        ),
      ),
    );
  }
}
