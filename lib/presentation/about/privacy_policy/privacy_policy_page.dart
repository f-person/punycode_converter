import 'package:flutter/material.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/core/layout/scrollable_flexible_view.dart';
import 'package:punycode_converter/presentation/core/widgets/app_text_button.dart';
import 'package:punycode_converter/presentation/core/widgets/blurred_app_bar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        title: Text(localization.privacyPolicy),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: AppTextButton(
                label: localization.doneButtonLabel,
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ),
          ),
        ],
        // leading: const SizedBox.shrink(),
      ),
      body: ScrollableFlexibleView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localization.privacyPolicyText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
