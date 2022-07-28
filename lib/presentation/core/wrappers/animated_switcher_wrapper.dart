import 'package:flutter/material.dart';

/// A wrapper around the built-in [AnimatedSwitcher] with
/// preconfigured parameters.
class AnimatedSwitcherWrapper extends StatelessWidget {
  const AnimatedSwitcherWrapper({
    required this.child,
    this.transitionBuilder = defaultTransitionBuilder,
    super.key,
  });

  final Widget child;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;

  static Widget defaultTransitionBuilder(
    Widget child,
    Animation<double> animation,
  ) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeInOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      transitionBuilder: transitionBuilder,
      child: child,
    );
  }
}
