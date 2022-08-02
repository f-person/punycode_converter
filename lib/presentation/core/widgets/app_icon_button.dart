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

  static const dimension = 48.0;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: onTap,
      child: SizedBox.square(
        dimension: dimension,
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
