import 'package:flutter/material.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/core/layout/scrollable_flexible_view.dart';
import 'package:punycode_converter/presentation/core/widgets/blurred_app_bar.dart';
import 'package:punycode_converter/presentation/core/widgets/done_app_bar_action.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        title: Text(localization.privacyPolicy),
        actions: const [DoneAppBarAction()],
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
