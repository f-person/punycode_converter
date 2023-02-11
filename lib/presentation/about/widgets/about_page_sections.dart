part of '../about_page.dart';

class _AboutPageSections extends StatelessWidget {
  const _AboutPageSections({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return ListView(
      children: [
        TilesListView(
          header: Text(localization.legalStuffTitle),
          children: [
            AppListTile(
              icon: const Icon(Boxicons.bx_file),
              label: Text(localization.privacyPolicy),
              onTap: () => _openPrivacyPolicy(context),
            ),
            AppListTile(
              icon: const Icon(Boxicons.bx_code_alt),
              label: Text(localization.licenses),
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: constF(const LicensesListPage()),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 30),
        TilesListView(
          header: Text(localization.contactAndSupportTitle),
          children: [
            AppListTile(
              icon: const Icon(Boxicons.bx_mail_send),
              label: Text(localization.email),
              trailing: const Text(AppStrings.supportEmail),
              onTap: () => urlLauncherLocator().launchUrl(AppStrings.supportEmailLink),
            ),
            AppListTile(
              icon: const Icon(Boxicons.bx_bulb),
              label: Text(localization.suggestImporvement),
              onTap: () => urlLauncherLocator().launchUrl(AppStrings.projectGitHubIssuesLink),
            ),
            AppListTile(
              icon: const Icon(Boxicons.bx_bug_alt),
              label: Text(localization.reportBug),
              onTap: () => urlLauncherLocator().launchUrl(AppStrings.projectGitHubIssuesLink),
            ),
            AppListTile(
              icon: const Icon(Boxicons.bxl_github),
              label: Text(localization.checkSourceCode),
              onTap: () => urlLauncherLocator().launchUrl(
                AppStrings.projectGitHubRepositoryLink,
              ),
            ),
            AppListTile(
              icon: const Icon(
                Boxicons.bxs_heart,
                color: AppColors.action,
              ),
              label: Text(_getReviewTileLabelText(localization)),
              onTap: () => inAppReviewLocator().openStoreReviewForm(),
            ),
          ],
        ),
        const SizedBox(height: 30),
        TilesListView(
          header: Text(localization.madeByTitle),
          children: [
            AppListTile(
              icon: const Icon(Boxicons.bxl_github),
              label: Text(localization.makerName),
              trailing: const Text(AppStrings.makerGitHubHandle),
              onTap: () => urlLauncherLocator().launchUrl(AppStrings.makerGitHubLink),
            ),
          ],
        ),
      ],
    );
  }

  void _openPrivacyPolicy(BuildContext context) {
    if (Platform.isAndroid) {
      urlLauncherLocator().launchUrl(AppStrings.privacyPolicyUrl);
    } else {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: constF(const PrivacyPolicyPage()),
        ),
      );
    }
  }

  String _getReviewTileLabelText(Localization localization) {
    if (Platform.isIOS || Platform.isMacOS) {
      return localization.reviewOnAppStore;
    } else {
      return localization.reviewOnGooglePlay;
    }
  }
}
