import 'package:flutter/material.dart';
import 'package:punycode_converter/presentation/core/gestures/tappable.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: onTap,
      child: SizedBox.square(
        dimension: 48.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon,
          ),
        ),
      ),
    );
  }
}
