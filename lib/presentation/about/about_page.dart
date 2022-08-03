import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:punycode_converter/application/core/app_strings.dart';
import 'package:punycode_converter/dependency_injection/dependencies/stores_dependencies.dart';
import 'package:punycode_converter/dependency_injection/dependencies/url_dependencies.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/about/licenses/licenses_list_page.dart';
import 'package:punycode_converter/presentation/about/privacy_policy/privacy_policy_page.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';
import 'package:punycode_converter/presentation/core/layout/tiles_list_view.dart';
import 'package:punycode_converter/presentation/core/widgets/app_list_tile.dart';
import 'package:punycode_converter/presentation/core/widgets/blurred_app_bar.dart';
import 'package:punycode_converter/presentation/core/widgets/done_app_bar_action.dart';

part 'widgets/about_page_sections.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return Navigator(
      onGenerateRoute: (_) => CupertinoPageRoute(
        builder: (_) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: BlurredAppBar(
            title: Text(localization.aboutAppLabel),
            actions: const [DoneAppBarAction()],
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: _AboutPageSections(),
          ),
        ),
      ),
    );
  }
}
