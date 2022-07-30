import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tappable extends StatefulWidget {
  const Tappable({
    required this.child,
    required this.onTap,
    this.enabled = true,
    this.tappedScale = 0.9,
    super.key,
  });

  final Widget child;
  final VoidCallback onTap;

  /// When `false`, no animation will be played and [onTap] won't be called.
  final bool enabled;

  /// Scale of the button when being pressed.
  final double tappedScale;

  @override
  State<Tappable> createState() => _TappableState();
}

class _TappableState extends State<Tappable> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => _startTapAnimation(),
        onTapUp: (_) => _onTapUp(),
        onTapCancel: _stopTapAnimation,
        child: AnimatedScale(
          curve: Curves.easeOut,
          scale: _isTapped ? widget.tappedScale : 1,
          duration: const Duration(milliseconds: 100),
          child: widget.child,
        ),
      ),
    );
  }

  void _onTapUp() {
    if (widget.enabled) {
      widget.onTap();
      HapticFeedback.lightImpact();
    }

    _stopTapAnimation();
  }

  void _stopTapAnimation() {
    setState(() => _isTapped = false);
  }

  void _startTapAnimation() {
    if (widget.enabled) {
      setState(() => _isTapped = true);
    }
  }
}
