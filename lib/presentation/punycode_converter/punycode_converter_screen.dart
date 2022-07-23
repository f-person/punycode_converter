import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:punycode_converter/gen/l10n.dart';

class PunycodeConverterScreen extends StatelessWidget {
  const PunycodeConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Punycode converter'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: localization.textInputLabel,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: localization.punycodeInputLabel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
