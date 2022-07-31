import 'package:flutter/material.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/core/widgets/app_text_button.dart';

class DoneAppBarAction extends StatelessWidget {
  const DoneAppBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: AppTextButton(
        label: localization.doneButtonLabel,
        onTap: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    );
  }
}
