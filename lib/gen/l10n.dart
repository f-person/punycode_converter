// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Localization {
  Localization();

  static Localization? _current;

  static Localization get current {
    assert(_current != null,
        'No instance of Localization was loaded. Try to initialize the Localization delegate before accessing Localization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Localization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Localization();
      Localization._current = instance;

      return instance;
    });
  }

  static Localization of(BuildContext context) {
    final instance = Localization.maybeOf(context);
    assert(instance != null,
        'No instance of Localization present in the widget tree. Did you add Localization.delegate in localizationsDelegates?');
    return instance!;
  }

  static Localization? maybeOf(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  /// `Text`
  String get textInputLabel {
    return Intl.message(
      'Text',
      name: 'textInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Punycode`
  String get punycodeInputLabel {
    return Intl.message(
      'Punycode',
      name: 'punycodeInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `What is Punycode?`
  String get whatIsPunycodeLabel {
    return Intl.message(
      'What is Punycode?',
      name: 'whatIsPunycodeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Punycode is a representation of Unicode with the limited ASCII character subset used for Internet hostnames. Using Punycode, host names containing Unicode characters are transcoded to a subset of ASCII consisting of letters, digits, and hyphens, which is called the letter-digit-hyphen (LDH) subset.`
  String get whatIsPunycodeDescription {
    return Intl.message(
      'Punycode is a representation of Unicode with the limited ASCII character subset used for Internet hostnames. Using Punycode, host names containing Unicode characters are transcoded to a subset of ASCII consisting of letters, digits, and hyphens, which is called the letter-digit-hyphen (LDH) subset.',
      name: 'whatIsPunycodeDescription',
      desc: '',
      args: [],
    );
  }

  /// `COPY`
  String get copyButtonLabel {
    return Intl.message(
      'COPY',
      name: 'copyButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Example: թութ.հայ`
  String get textExample {
    return Intl.message(
      'Example: թութ.հայ',
      name: 'textExample',
      desc: '',
      args: [],
    );
  }

  /// `Example: xn--69aa8bzb.xn--y9a3aq`
  String get punycodeExample {
    return Intl.message(
      'Example: xn--69aa8bzb.xn--y9a3aq',
      name: 'punycodeExample',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsScreenTitle {
    return Intl.message(
      'Settings',
      name: 'settingsScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Licenses`
  String get licenses {
    return Intl.message(
      'Licenses',
      name: 'licenses',
      desc: '',
      args: [],
    );
  }

  /// `No data is collected 🦄`
  String get privacyPolicyText {
    return Intl.message(
      'No data is collected 🦄',
      name: 'privacyPolicyText',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get doneButtonLabel {
    return Intl.message(
      'Done',
      name: 'doneButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get aboutAppLabel {
    return Intl.message(
      'About',
      name: 'aboutAppLabel',
      desc: '',
      args: [],
    );
  }

  /// `LEGAL STUFF`
  String get legalStuffTitle {
    return Intl.message(
      'LEGAL STUFF',
      name: 'legalStuffTitle',
      desc: '',
      args: [],
    );
  }

  /// `MADE BY`
  String get madeByTitle {
    return Intl.message(
      'MADE BY',
      name: 'madeByTitle',
      desc: '',
      args: [],
    );
  }

  /// `CONTACT & SUPPORT`
  String get contactAndSupportTitle {
    return Intl.message(
      'CONTACT & SUPPORT',
      name: 'contactAndSupportTitle',
      desc: '',
      args: [],
    );
  }

  /// `Arshak Aghakaryan`
  String get makerName {
    return Intl.message(
      'Arshak Aghakaryan',
      name: 'makerName',
      desc: '',
      args: [],
    );
  }

  /// `Review on the App Store`
  String get reviewOnAppStore {
    return Intl.message(
      'Review on the App Store',
      name: 'reviewOnAppStore',
      desc: '',
      args: [],
    );
  }

  /// `Review on Google Play`
  String get reviewOnGooglePlay {
    return Intl.message(
      'Review on Google Play',
      name: 'reviewOnGooglePlay',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Report a bug`
  String get reportBug {
    return Intl.message(
      'Report a bug',
      name: 'reportBug',
      desc: '',
      args: [],
    );
  }

  /// `Suggest an improvement`
  String get suggestImporvement {
    return Intl.message(
      'Suggest an improvement',
      name: 'suggestImporvement',
      desc: '',
      args: [],
    );
  }

  /// `Check the source code`
  String get checkSourceCode {
    return Intl.message(
      'Check the source code',
      name: 'checkSourceCode',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Punycode`
  String get invalidPunycodeError {
    return Intl.message(
      'Invalid Punycode',
      name: 'invalidPunycodeError',
      desc: '',
      args: [],
    );
  }

  /// `Support the developer`
  String get supportDeveloper {
    return Intl.message(
      'Support the developer',
      name: 'supportDeveloper',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Localization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Localization> load(Locale locale) => Localization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
