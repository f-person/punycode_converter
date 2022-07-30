import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  const BlurredContainer({
    required this.child,
    required this.color,
    this.blur = 20,
    super.key,
  });

  final Widget child;
  final Color color;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: ColoredBox(
          color: color,
          child: child,
        ),
      ),
    );
  }
}
