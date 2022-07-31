import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';
import 'package:punycode_converter/presentation/core/widgets/app_icon_button.dart';
import 'package:punycode_converter/presentation/core/widgets/blurred_container.dart';

class BlurredAppBar extends AppBar {
  BlurredAppBar({
    super.title,
    super.actions,
    super.key,
  }) : super(
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: const BlurredContainer(
            color: AppColors.primary60,
            child: SizedBox.expand(),
          ),
          bottom: const PreferredSize(
            preferredSize: Size(_dividerWidth, _dividerHeight),
            child: SizedBox(
              width: double.infinity,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.divider),
              ),
            ),
          ),
          leading: const _AppBarLeading(),
        );

  static const _dividerWidth = double.infinity;
  static const _dividerHeight = 1.0;
}

class _AppBarLeading extends StatelessWidget {
  const _AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;

    if (!canPop) {
      return const SizedBox.shrink();
    }

    return AppIconButton(
      icon: const Icon(FontAwesomeIcons.angleLeft),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
