import 'package:flutter/material.dart';

/// A widget that lets you use [Flexible] widgets inside a [Column]
/// while making it scrollable when the contents don't fir the height
/// of the parent.
class ScrollableFlexibleView extends StatelessWidget {
  const ScrollableFlexibleView({
    required this.child,
    this.physics,
    super.key,
  });

  final Widget child;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: physics,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
      },
    );
  }
}
