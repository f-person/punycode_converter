import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide LicensePage;
import 'package:fpdart/fpdart.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/gen/licenses.dart';
import 'package:punycode_converter/presentation/about/licenses/license_page.dart';
import 'package:punycode_converter/presentation/core/layout/tiles_list_view.dart';
import 'package:punycode_converter/presentation/core/widgets/app_list_tile.dart';
import 'package:punycode_converter/presentation/core/widgets/blurred_app_bar.dart';
import 'package:punycode_converter/presentation/core/widgets/done_app_bar_action.dart';

class LicensesListPage extends StatelessWidget {
  const LicensesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);

    return Scaffold(
      appBar: BlurredAppBar(
        title: Text(localization.licenses),
        actions: const [DoneAppBarAction()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: SafeArea(
            child: TilesListView(
              children: ossLicenses.map(
                (package) => AppListTile(
                  label: Text(package.name),
                  trailing: Text(package.version),
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: constF(LicensePage(package: package)),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
