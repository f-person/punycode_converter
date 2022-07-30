import 'package:flutter/material.dart';
import 'package:flutter_top_blocked_bouncing_scroll_physics/flutter_top_blocked_bouncing_scroll_physics.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:punycode_converter/application/core/app_strings.dart';
import 'package:punycode_converter/dependency_injection/dependencies/stores_dependencies.dart';
import 'package:punycode_converter/dependency_injection/dependencies/url_dependencies.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';
import 'package:punycode_converter/presentation/core/layout/tiles_list_view.dart';
import 'package:punycode_converter/presentation/core/widgets/app_list_tile.dart';
import 'package:punycode_converter/presentation/core/widgets/app_text_button.dart';
import 'package:punycode_converter/presentation/core/widgets/blurred_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: BlurredContainer(
          color: AppColors.primary.withOpacity(0.6),
          child: const SizedBox.expand(),
        ),
        title: Text(localization.aboutAppLabel),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: AppTextButton(
                label: localization.doneButtonLabel,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
        leading: const SizedBox.shrink(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: ListView(
          physics: const TopBlockedBouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            TilesListView(
              header: Text(localization.legalStuffTitle),
              children: [
                AppListTile(
                  icon: const Icon(FontAwesomeIcons.fileLines),
                  label: Text(localization.privacyPolicy),
                  onTap: () {},
                ),
                AppListTile(
                  icon: const Icon(FontAwesomeIcons.fileCode),
                  label: Text(localization.licenses),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 30),
            TilesListView(
              header: Text(localization.contactAndSupportTitle),
              children: [
                AppListTile(
                  icon: const Icon(FontAwesomeIcons.comment),
                  label: Text(localization.email),
                  trailing: const Text(AppStrings.supportEmail),
                  onTap: () => urlLauncherLocator().launchUrl(AppStrings.supportEmailLink),
                ),
                AppListTile(
                  icon: const Icon(FontAwesomeIcons.lightbulb),
                  label: Text(localization.suggestImporvement),
                  onTap: () => urlLauncherLocator().launchUrl(AppStrings.projectGitHubIssuesLink),
                ),
                AppListTile(
                  icon: const Icon(FontAwesomeIcons.bug),
                  label: Text(localization.reportBug),
                  onTap: () => urlLauncherLocator().launchUrl(AppStrings.projectGitHubIssuesLink),
                ),
                AppListTile(
                  icon: const SizedBox(
                    width: 24,
                    child: Icon(
                      FontAwesomeIcons.code,
                      size: 20,
                    ),
                  ),
                  label: Text(localization.checkSourceCode),
                  onTap: () => urlLauncherLocator().launchUrl(
                    AppStrings.projectGitHubRepositoryLink,
                  ),
                ),
                AppListTile(
                  icon: const Icon(
                    FontAwesomeIcons.solidHeart,
                    color: AppColors.action,
                  ),
                  label: Text(localization.reviewOnAppStore),
                  onTap: () => inAppReviewLocator().openStoreReviewForm(),
                ),
              ],
            ),
            const SizedBox(height: 30),
            TilesListView(
              header: Text(localization.madeByTitle),
              children: [
                AppListTile(
                  icon: const Icon(FontAwesomeIcons.github),
                  label: Text(localization.makerName),
                  trailing: const Text(AppStrings.makerGitHubHandle),
                  onTap: () => urlLauncherLocator().launchUrl(AppStrings.makerGitHubLink),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
