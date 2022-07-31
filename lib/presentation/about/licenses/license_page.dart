import 'package:flutter/material.dart';
import 'package:punycode_converter/gen/licenses.dart';
import 'package:punycode_converter/presentation/core/layout/scrollable_flexible_view.dart';
import 'package:punycode_converter/presentation/core/widgets/blurred_app_bar.dart';
import 'package:punycode_converter/presentation/core/widgets/done_app_bar_action.dart';

class LicensePage extends StatelessWidget {
  const LicensePage({required this.package, super.key});

  final Package package;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlurredAppBar(
        title: Text(package.name),
        actions: const [DoneAppBarAction()],
      ),
      body: ScrollableFlexibleView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: SafeArea(
            child: Text(package.license ?? 'No license?'),
          ),
        ),
      ),
    );
  }
}
