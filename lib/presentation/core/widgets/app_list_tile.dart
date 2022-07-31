import 'package:flutter/material.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';
import 'package:punycode_converter/presentation/core/gestures/tappable.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    required this.label,
    required this.onTap,
    this.icon,
    this.trailing,
    super.key,
  });

  final Widget label;
  final Widget? icon;
  final Widget? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final trailing = this.trailing;

    return Tappable(
      tappedScale: 0.96,
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            if (icon == null)
              const SizedBox(width: 10)
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: icon,
              ),
            label,
            if (trailing != null) ...[
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  color: AppColors.textSecondary,
                ),
                child: trailing,
              ),
              const SizedBox(width: 10),
            ],
          ],
        ),
      ),
    );
  }
}
