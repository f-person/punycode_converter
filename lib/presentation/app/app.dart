import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:punycode_converter/gen/l10n.dart';
import 'package:punycode_converter/presentation/core/design_system/colors.dart';
import 'package:punycode_converter/presentation/punycode_converter/punycode_converter_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.secondary30,
        ),
        scaffoldBackgroundColor: AppColors.primary,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColors.action10,
          selectionHandleColor: AppColors.action,
          cursorColor: AppColors.action,
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          // Overrides the selection handle color.
          primaryColor: AppColors.action,
        ),
      ),
      localizationsDelegates: const [
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('en'),
      ],
      home: const PunycodeConverterScreen(),
    );
  }
}
