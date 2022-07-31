import 'package:flutter/material.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';

class TilesListView extends StatelessWidget {
  const TilesListView({
    required this.children,
    this.header,
    super.key,
  });

  final Iterable<Widget> children;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    final header = this.header;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
              child: header,
            ),
          ),
        DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColors.secondary30,
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: children.length,
            itemBuilder: (_, index) {
              return children.elementAt(index);
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: double.infinity,
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.divider,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
